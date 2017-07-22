require("spec_helper")

describe(Distributor) do

  it("validates presence of name") do
    distributor = Distributor.new({:distributor_name => ""})
    expect(distributor.save()).to(eq(false))
  end

  it("validates the length of the telephone number inserted to be 11 digits at most")  do
    distributor = Distributor.new({:distributor_name => "Wachira", :tel => "072588888888".*(12)})
    expect(distributor.save()).to(eq(false))
  end
  it('belongs to a brand') do
    brand = Brand.create({:name => 'Adidas'})
       distributor = brand.distributors().new({:distributor_name => 'Wachira'})
       expect(brand.distributors()).to(eq([distributor]))
    end

describe('Distributor#titlecase_name') do
  it ("converts the name to title case") do
    distributor = Distributor.create({:distributor_name => "wachira shine"})
    expect(distributor.name()).to(eq("Wachira Shine"))
    end
  end
end
