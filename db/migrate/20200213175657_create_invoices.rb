class CreateInvoices < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE invoice_status AS ENUM (
        'placed',
        'pending',
        'processed',
        'shipped',
        'completed'
      );
    SQL

    create_table :invoices do |t|
      t.belongs_to :contact, null: false, foreign_key: true, index: true
      t.datetime :order_date, null: false, index: true
      t.datetime :shipment_date, index: true
      t.references :shipping_address, references: :address, foreign_key: { to_table: :addresses }, index: true
      t.references :billing_address, references: :address, foreign_key: { to_table: :addresses }, index: true
      t.belongs_to :payment_type, null: false, foreign_key: true, index: true
      t.belongs_to :carrier, null: false, foreign_key: true, index: true
      t.column :status, :invoice_status, null: false, foreign_key: true
      t.decimal :total
      t.decimal :tax
      t.decimal :shipping_handling
      t.decimal :subtotal
      t.integer :invoice_number

      t.timestamps
    end
  end

  def down
    drop_table :invoices
  end
end
