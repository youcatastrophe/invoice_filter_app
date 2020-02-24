class RemoveAddressFromContacts < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :address_id
  end
end
