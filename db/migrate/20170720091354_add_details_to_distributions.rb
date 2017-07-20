class AddDetailsToDistributions < ActiveRecord::Migration[5.1]
  def change
    add_column(:distributions, :address, :string)
    add_column(:distributions, :phone, :string)
  end
end
