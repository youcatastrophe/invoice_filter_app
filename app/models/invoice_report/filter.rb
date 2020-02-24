class InvoiceReport::Filter
  include ActiveModel::Model

  def self.key
    name.demodulize.underscore
  end

  def required_associations
    []
  end

  def matches? invoice
    raise NotImplementedError
  end

  attr_accessor :_destroy

  def new_record?
    true
  end

  def marked_for_destruction?
    @_destroy
  end
end