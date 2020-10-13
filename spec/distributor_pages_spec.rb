require("spec_helper")

describe('Distribution Pages Path', {:type => :feature}) do

   it('allows users to add a new store to the database') do
     visit('/')
     click_link('Add a New Distribution')
     fill_in('name', :with => 'Wachira Shine')
     fill_in('city', :with => 'Nairobi')
     fill_in('street', :with => 'Tom Mboya')
     fill_in('building', :with => 'Old Nation house')
     fill_in('tel', :with => '0725888888')
     click_button('Add Distribution')
     expect(page).to have_content('Wachira Shine')
   end

   it ("allows uses to view  a list of distributions") do
     Distribution.create({:name => "Wachira"})
     visit('/distributions')
     expect(page).to have_content("Wachira")
   end

   it('allows users to update distribution path') do
     Distribution.create({:name => 'Wachira'})
     visit('/distributions')
     click_link('Wachira')
     click_link('Update Distribution Details')
     fill_in('name', :with => 'Wachira Shine')
     click_button('Update')
     expect(page).to have_content('Wachira Shine')
   end

   it('allows users to delete a distribution from the database') do
       Distribution.create({:name => 'Wachira'})
       visit('/distributions')
       click_link('Wachira')
       click_link('Update Distribution Details')
       click_button('Delete Wachira')
       expect(page).to have_no_content('Wachira')
     end
  end
