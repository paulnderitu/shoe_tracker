class CreateDistributions < ActiveRecord::Migration[5.1]
  def change
    create_table(:distributions) do |t|
      t.column(:distributor, :string)

      t.timestamps()
    end
  end
end
