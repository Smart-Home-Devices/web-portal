class RemoveFamily < ActiveRecord::Migration
  def change
  	
  	remove_index "families", name: "index_families_on_email"
	remove_index "families", name: "index_families_on_reset_password_token"
  	drop_table :families

  end
end
