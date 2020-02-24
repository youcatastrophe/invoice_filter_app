class PaymentType < ApplicationRecord
  has_many :invoices, inverse_of: :payment_type, dependent: :restrict_with_error
end
