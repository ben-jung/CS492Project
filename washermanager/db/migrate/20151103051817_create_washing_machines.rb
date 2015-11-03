class CreateWashingMachines < ActiveRecord::Migration
  def change
    create_table :washing_machines do |t|
      t.integer :floor
      t.string :dorm
      t.string :state

      t.timestamps null: false
    end
  end
end
