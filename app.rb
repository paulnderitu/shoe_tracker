require('bundler/setup')
 Bundler.require(:default)

 Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
    erb(:index)
end

get('/distributors/new') do
  @brands = Brand.all()
    erb(:distributor_form)
end

post('/distributors') do
  distributor_name = params.fetch("distributor_name")
  city = params[:city]
  street = params[:street]
  building = params[:building]
  tel = params[:tel]
  address = "#{city}\n#{street}, #{building}"
  brand_ids = params[:brand_ids]
  @distributor = Distributor.create({:distributor_name => distributor_name, :address => address, :tel => tel, :brand_ids => brand_ids})
  if @distributor.save()
    redirect('/distributors/'.concat(@distributor.id().to_s()))
  else
    erb(:errors)
  end
end

get('/distributors/:id') do
  @distributor = Distributor.find(params.fetch('id').to_i())
  erb(:distributor)
 end

get('/distributors')do
  @distributors = Distributor.all()
  erb(:distributors)
end

get('/distributors/:id/edit') do
   @distributor = Distributor.find(params.fetch('id').to_i())
   @brands = Brand.all() - @distributor.brands()
   erb(:distributor_edit)
 end

 patch('/distributors/:id') do
   @distributor = Distributor.find(params.fetch('id').to_i())
   name = params.fetch('distributor_name')
   address = params[:address]
   tel = params[:tel]

  new_brand_ids = params[:brand_ids]
   all_brand_ids = []
   @distributor.brands.each() do |brand|
     all_brand_ids.push(brand.id())
   end
   if new_brand_ids
     new_brand_ids.each() do |id|
       all_brand_ids.push(id)
     end
   end

  @distributor.update({:distributor_name => name, :address => address, :tel => tel, :brand_ids => all_brand_ids})
   if @distributor.save()
     redirect('/distributors/'.concat(@distributor.id().to_s()))
   else
     erb(:distributor_errors)
   end
 end

 delete('/distributors/:id') do
    @distributor = Distributor.find(params.fetch('id').to_i())
    @distributor.destroy()
    redirect('/distributors')
  end

  post('/brands') do
     name = params.fetch('brand_name')
     @brand = Brand.create({:name => name})
     if @brand.save()
       redirect back
     else
       erb(:brand_errors)
     end
   end
