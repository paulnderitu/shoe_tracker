require("spec_helper")

describe(Distribution) do

  it("validates presence of name") do
    distribution = Distribution.new({:name => ""})
    expect(distribution.save()).to(eq(false))
  end

  it("validates the length of the telephone number inserted to be 11 digits at most")  do
    distribution = Distribution.new({:name => "Wachira", :tel => "072588888888".*(12)})
    expect(distribution.save()).to(eq(false))
  end
  it('belongs to a brand') do
    brand = Brand.create({:name => 'Adidas'})
       distribution = brand.distributions().new({:name => 'Wachira'})
       expect(brand.distributions()).to(eq([distribution]))
    end

describe('Distribution#titlecase_name') do
  it ("converts the name to title case") do
    distribution = Distribution.create({:name => "wachira shine"})
    expect(distribution.name()).to(eq("Wachira Shine"))
    end
  end
end
