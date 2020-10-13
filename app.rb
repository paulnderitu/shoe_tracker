require('bundler/setup')
 Bundler.require(:default)

 Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
    erb(:index)
end

get('/distributions/new') do
  @brands = Brand.all()
    erb(:distribution_form)
end

post('/distributions') do
  name = params.fetch("name")
  city = params[:city]
  street = params[:street]
  building = params[:building]
  tel = params[:tel]
  address = "#{city}\n#{street}, #{building}"
  brand_ids = params[:brand_ids]
  @distribution = Distribution.create({:name => name, :address => address, :tel => tel, :brand_ids => brand_ids})
  if @distribution.save()
    redirect('/distributions/'.concat(@distribution.id().to_s()))
  else
    erb(:distribution_errors)
  end
end

get('/distributions/:id') do
  @distribution = Distribution.find(params.fetch('id').to_i())
  erb(:distribution)
 end

get('/distributions') do
  @distributions = Distribution.all()
  erb(:distributions)
end

get('/distributions/:id/edit') do
   @distribution = Distribution.find(params.fetch('id').to_i())
   @brands = Brand.all() -  @distribution.brands()
   erb(:distribution_edit)
 end

 patch('/distributions/:id') do
   @distribution = Distribution.find(params.fetch('id').to_i())
   name = params.fetch('name')
   address = params[:address]
   tel = params[:tel]

  new_brand_ids = params[:brand_ids]
  remove_brand_ids = params[:remove_brand_ids]
    if remove_brand_ids
     remove_brand_ids.each() do |id|
       @distribution.brands().destroy(Brand.find(id))
     end
    end

   all_brand_ids = []
   @distribution.brands.each() do |brand|
     all_brand_ids.push(brand.id())
   end
   if new_brand_ids
     new_brand_ids.each() do |id|
       all_brand_ids.push(id)
     end
   end

  @distribution.update({:name => name, :address => address, :tel => tel, :brand_ids => all_brand_ids})
   if @distribution.save()
     redirect('/distributions/'.concat(@distribution.id().to_s()))
   else
     erb(:distribution_errors)
   end
 end

 delete('/distributions/:id') do
    @distribution = Distribution.find(params.fetch('id').to_i())
    @distribution.destroy()
    redirect('/distributions')
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

   get('/brands') do
   @brands = Brand.all()
   erb(:brands)
 end

get ('/brands/:id')do
  @brand = Brand.find(params.fetch('id').to_i())
  erb(:brand)
end

patch('/brands/:id') do
   @brand = Brand.find(params.fetch('id').to_i())
   name = params.fetch('brand_name')
   @brand.update({:name => name})
   if @brand.save()
     redirect back
   else
     erb(:brand_errors)
   end

 delete('/brands/:id') do
   @brand = Brand.find(params.fetch('id').to_i())
   @brand.destroy()
   redirect('/brands')
 end
end
