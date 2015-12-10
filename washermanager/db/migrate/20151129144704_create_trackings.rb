class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.integer :machine_id
      t.string :APNS_token

      t.timestamps null: false
    end
  end
end
