class AddPrimaryAndContactIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :contact, index: true, foreign_key: true, null: false
    add_column :addresses, :primary, :boolean, default: false, null: false
  end
end
