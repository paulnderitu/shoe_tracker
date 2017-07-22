require('spec_helper')

 describe('Add a brand path', {:type => :feature}) do
   it('allows users to add a new brand to the database') do
     visit('/brands')
     fill_in('brand_name', :with => 'Adidas')
     click_button('Add Brand')
     expect(page).to have_content('Adidas')
   end
 end

 describe('Add a brand to a store path', {:type => :feature}) do
    it('allows the administrator to add brands to a distributor') do
      Brand.create({:name => 'Adidas'})
      visit('/distributors/new')
      fill_in('name', :with => 'Wachira')
      check('Adidas')
      click_button('Add Distributor')
      expect(page).to have_content('Adidas')
    end
    it('allows the user to view all brands for a distributor') do
     distributor = Distributor.create({:name => 'Wachira'})
     distributor.brands().create({:name => 'Adidas'})
     visit('/distributors')
     click_link('Wachira')
     expect(page).to have_content('Adidas')
   end
  end

  describe('Counterchecking brands when updating a distributor path', {:type => :feature}) do
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

  it('allows the user to remove a brand when updating store information') do
    distributor = Distributor.create(:name => 'Wachira')
    distributor.brands().create(:name => 'Adidas')
    visit('/distributors')
    click_link('Wachira')
    click_link('Update Distributor Details')
    check('Adidas')
    click_button('Update')
    expect(page).to have_no_content('Adidas')
    end
    
    describe('Update a brand path', {:type => :feature}) do
       it('allows the user to view a brand page with distributor names') do
         distributor = Distributor.create(:name => 'Wachira')
         distributor.brands().create(:name => 'Adidas')
         visit('/brands')
         click_link('Adidas')
         expect(page).to have_content('Adidas')
       end
     end
  end
