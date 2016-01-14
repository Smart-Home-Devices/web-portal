class AddFamilyIdToDevices < ActiveRecord::Migration
  def change
  	add_column :devices, :family_id, :integer
  end
end
