class CreateMacFloors < ActiveRecord::Migration
  def change
    create_table :mac_floors do |t|
      t.string :mac_address
      t.integer :floor

      t.timestamps null: false
    end
  end
end
