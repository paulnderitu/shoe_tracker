require("spec_helper")

describe(Distributor) do

  it("validates presence of name") do
    distributor = Distributor.new({:distributor_name => ""})
    expect(distributor.save()).to(eq(false))
  end

  it("validates the length of the telephone number inserted to be 10 digits at most")  do
    distributor = Distributor.new({:distributor_name => "wachira", :tel => "0725".*(11)})
    expect(distributor.save()).to(eq(false))
  end
end
