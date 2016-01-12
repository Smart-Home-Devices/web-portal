class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.boolean :state
   
      t.timestamps null: false
    end
  end
end
