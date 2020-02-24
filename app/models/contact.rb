class Contact < ApplicationRecord
  belongs_to :user
  has_many :addresses, inverse_of: :contact, dependent: :destroy
  has_many :invoices, inverse_of: :contact, dependent: :restrict_with_error

  validates :first_name, :last_name, presence: true
end
