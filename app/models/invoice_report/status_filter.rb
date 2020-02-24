class InvoiceReport::StatusFilter < InvoiceReport::Filter
  attr_accessor :statuses

  def matches? invoice
    statuses.include? invoice.status
  end

end