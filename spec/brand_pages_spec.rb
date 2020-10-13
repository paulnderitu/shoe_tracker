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
    it('allows the administrator to add brands to a distribution') do
      Brand.create({:name => 'Adidas'})
      visit('/distributions/new')
      fill_in('name', :with => 'Wachira')
      check('Adidas')
      click_button('Add Distribution')
      expect(page).to have_content('Adidas')
    end
    it('allows the user to view all brands for a distribution') do
     distribution = Distribution.create({:name => 'Wachira'})
     distribution.brands().create({:name => 'Adidas'})
     visit('/distributions')
     click_link('Wachira')
     expect(page).to have_content('Adidas')
   end
  end

  describe('Counterchecking brands when updating a distribution path', {:type => :feature}) do
     it('allows the user to add a brand when updating distribution Details') do
       Distribution.create(:name => 'Wachira')
       Brand.create(:name => 'Adidas')
       visit('/distributions')
       click_link('Wachira')
       click_link('Update distribution Details')
       check('Adidas')
       click_button('Update')
       expect(page).to have_content('Adidas')
     end

  it('allows the user to remove a brand when updating store information') do
    distribution = Distribution.create(:name => 'Wachira')
    distribution.brands().create(:name => 'Adidas')
    visit('/distributions')
    click_link('Wachira')
    click_link('Update Distribution Details')
    check('Adidas')
    click_button('Update')
    expect(page).to have_no_content('Adidas')
    end

    describe('Update a brand path', {:type => :feature}) do
       it('allows the user to view a brand page with distribution names') do
         distribution = Distribution.create(:name => 'Wachira')
         distribution.brands().create(:name => 'Adidas')
         visit('/brands')
         click_link('Adidas')
         expect(page).to have_content('Adidas')
       end
     end

    it('allows the user to edit a brand name') do
   brand = Brand.create(:name => 'Adidas')
     visit('/brands')
     click_link('Adidas')
     fill_in('name', :with => 'Puma')
     click_button('Edit')
     expect(page).to have_content('Puma')
   end

   it('allows the user to delete a brand from the database') do
     brand = Brand.create(:name => 'Adidas')
     visit('/brands')
     click_link('Adidas')
     click_button('Delete Adidas')
     expect(page).to have_no_content('Adidas')
   end
  end
