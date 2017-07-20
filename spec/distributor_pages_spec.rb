require("spec_helper")

describe('Distributor Pages Path', {:type => :feature}) do

describe('Add a Distributor path', {:type => :feature}) do
   it('allows users to add a new store to the database') do
     visit('/')
     click_link('Add a New Distributor')
     fill_in('distributor_name', :with => 'Wachira Shine')
     fill_in('city', :with => 'Nairobi')
     fill_in('street', :with => 'Tom Mboya')
     fill_in('building', :with => 'Old Nation house')
     fill_in('tel', :with => '0725888888')
     click_button('Add Distributor')
     expect(page).to have_content('Wachira Shine')
   end

   it ("allows uses to view  a list of distributors") do
     Distributor.create({:name => "Wachira"})
     visit('/distributors')
     expect(page).to have_content("wachira")
   end
  end
end
