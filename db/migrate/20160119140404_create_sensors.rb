class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name	
      t.boolean :state, :default => false
      t.decimal :value, :precision => 5, :scale => 2
      t.string :rpi_id
      t.integer :family_id
      t.timestamps null: false
    end
  end
end
