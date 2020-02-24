class InvoiceReport::PaymentTypeFilter < InvoiceReport::Filter
  attr_accessor :payment_type_ids

  def required_association 
    [:payment_type]
  end

  # def payment_type_ids
  #   payment_types.(:map, &:id)
  # end

  # def payment_ids=(payment_ids)
  #   self.payment_types = Payment.where(id: payment_ids.try(:select, &:present?))
  # end

  def matches? invoice
    payment_type_ids.include? invoice.payment_type_id
  end

end