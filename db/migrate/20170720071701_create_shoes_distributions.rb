class CreateShoesDistributions < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoes_distributions) do |t|
      t.column(:brand_id, :integer)
      t.column(:distributor_id, :integer)

      t.timestamps()
    end
  end
end
