require("spec_helper")

describe(Distributor) do
  it("validates presence of name") do
    distributor = Distributor.new({:name => ""})
    expect(distributor.save()).to(eq(false))
  end
end
