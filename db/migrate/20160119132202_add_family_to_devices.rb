class AddFamilyToDevices < ActiveRecord::Migration
  def change
  	remove_column :devices, :family_id
  	add_column :devices, :family_id, :integer
  end
end
