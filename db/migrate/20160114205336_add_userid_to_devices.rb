class AddUseridToDevices < ActiveRecord::Migration
  def change
  	add_column :devices, :user_id, :string
  	add_column :devices, :rpi_id, :string
  	remove_column :devices, :family_id, :integer
  	add_index :families, :rpi_id, unique: true
  	
  end
end
