class Invoice < ApplicationRecord
  belongs_to :contact
  belongs_to :payment_type
  belongs_to :carrier
  belongs_to :billing_address, class_name: "Address", foreign_key: "billing_address_id", inverse_of: :invoices_as_billing_address
  belongs_to :shipping_address, class_name: "Address", foreign_key: "shipping_address_id", inverse_of: :invoices_as_shipping_address
end
