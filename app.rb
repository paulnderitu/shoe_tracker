require('bundler/setup')
 Bundler.require(:default)

 Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
    erb(:index)
end

get('/distributors/new') do
    erb(:distributor_form)
end

post('/distributors') do
  distributor_name = params.fetch("distributor_name")
  city = params[:city]
  street = params[:street]
  building = params[:building]
  tel = params[:tel]
  address = "#{city}\n#{street}, #{building}"
  @distributor = Distributor.create({:distributor_name => distributor_name, :address => address, :tel => tel})
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
