class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name
      t.string :rpi_id	
      t.timestamps null: false
    end
  end
end
