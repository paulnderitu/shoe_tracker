class CreateBrandsDistributions < ActiveRecord::Migration[5.1]
  def change
    create_table(:brands_distributions) do |t|
      t.column(:brand_id, :integer)
      t.column(:distributor_id, :integer)

      t.timestamps()
    end
  end
end
