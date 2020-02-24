class InvoiceReport::ContactFilter < InvoiceReport::Filter
  attr_accessor :contact_ids

  validates :contact_ids, presence: true

  def required_associations
    [:contact]
  end

  # def contact_ids
  #   contacts.try(:map, &:id) # Couldn't I simply do `contacts.pluck(:id)` here? 
  # end

  # def contact_ids=(contact_ids)
  #   self.contacts = Contact.where(id: contact_ids.try(:select, &:present?)) # I think `contact_ids.compact` would've worked better.
  # end

  def matches? invoice
    contact_ids.include? invoice.contact_id
  end

end