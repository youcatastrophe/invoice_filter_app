class Carrier < ApplicationRecord
  has_many :invoices, inverse_of: :carrier, dependent: :restrict_with_error
end
