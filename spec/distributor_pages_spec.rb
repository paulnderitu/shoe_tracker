require("spec_helper")

describe('Distributor Pages Path', {:type => :feature}) do

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

   it('allows users to update distributor information') do
     Distributor.create({:distributor_name => 'Wachira'})
     visit('/distributors')
     click_link('Wachira')
     click_link('Update Distributor Details')
     fill_in('distributor_name', :with => 'Wachira Shine')
     click_button('Update')
     expect(page).to have_content('Wachira Shine')
   end

   it('allows users to delete a store from the database') do
       Distributor.create({:distributor_name => 'Wachira Shine'})
       visit('/distributors')
       click_link('Wachira')
       click_link('Update Distributor Information')
       click_button('Delete Wachira')
       expect(page).to have_no_content('Wachira')
     end
  end
