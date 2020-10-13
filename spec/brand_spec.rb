require("spec_helper")

describe(Brand) do
  it("validates the availability of a new brand name") do
    brand = Brand.new({:name => ""})
     expect(brand.save()).to(eq(false))
  end

  it('belongs to a distribution') do
     distribution = Distribution.create({:name => 'Wachira'})
     brand = distribution.brands().new({:name => 'Adidas'})
     expect(distribution.brands()).to(eq([brand]))
   end
   describe('Brand#titlecase_name') do
     it('converts the name to title case') do
       brand = Brand.create({:name => 'high stepper'})
       expect(brand.name()).to(eq('High Stepper'))
     end
   end
end
