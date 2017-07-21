class CreateBrandsDistributions < ActiveRecord::Migration[5.1]
  def change
    create_table(:brand_distributors) do |t|
      t.column(:brand_id, :integer)
      t.column(:distributor_id, :integer)
    end
  end
end
