require('spec_helper')

 describe('Add a brand path', {:type => :feature}) do
   it('allows users to add a new brand to the database') do
     visit('/distributors/new')
     fill_in('brand_name', :with => 'Adidas')
     click_button('Add Brand')
     expect(page).to have_content('Adidas')
   end
 end

 describe('Add a brand to a store path', {:type => :feature}) do
    it('allows the users to add brands to a distributor') do
      Brand.create({:name => 'Adidas'})
      visit('/distributors/new')
      fill_in('name', :with => 'Wachira')
      check('Adidas')
      click_button('Add Distributor')
      expect(page).to have_content('Adidas')
    end
  end

  describe('Add a brand when updating a distributor path', {:type => :feature}) do
     it('allows the user to add a brand when updating distributor Details') do
       Distributor.create(:name => 'Wachira')
       Brand.create(:name => 'Adidas')
       visit('/distributors')
       click_link('Wachira')
       click_link('Update distributor Details')
       check('Adidas')
       click_button('Update')
       expect(page).to have_content('Adidas')
     end
  end
