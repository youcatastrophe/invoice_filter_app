class Address < ApplicationRecord
  belongs_to :contact
  has_many :invoices_as_billing_address, class_name: "Invoice", foreign_key: "billing_address_id", dependent: :restrict_with_error
  has_many :invoices_as_shipping_address, class_name: "Invoice", foreign_key: "shipping_address_id", dependent: :restrict_with_error
end
