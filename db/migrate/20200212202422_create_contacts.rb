class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.string :prefix
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.date :birthday
      t.string :mobile_phone
      t.string :email
      t.string :home_phone
      t.string :work_phone
      t.belongs_to :address, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
