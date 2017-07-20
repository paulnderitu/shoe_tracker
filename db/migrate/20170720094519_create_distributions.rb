class CreateDistributions < ActiveRecord::Migration[5.1]
  def change
    create_table(:distributions) do |t|
      t.column(:distributor_name, :string)
      t.column(:address, :string)
      t.column(:tel, :string)

      t.timestamps()
    end
  end
end
