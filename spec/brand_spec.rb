require("spec_helper")

describe(Brand) do
  it("validates the availability of a new brand name") do
    brand = Brand.new({:name => ""})
     expect(brand.save()).to(eq(false))
  end

  it('belongs to a distributor') do
     distributor = Distributor.create({:distributor_name => 'Wachira'})
     brand = distributor.brands().new({:name => 'Adidas'})
     expect(distributor.brands()).to(eq([brand]))
   end
   describe('Brand#titlecase_name') do
     it('converts the name to title case') do
       brand = Brand.create({:name => 'high stepper'})
       expect(brand.name()).to(eq('High Stepper'))
     end
   end
end
