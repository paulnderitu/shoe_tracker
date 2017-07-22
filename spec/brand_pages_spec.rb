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
