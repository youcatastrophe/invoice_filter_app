class InvoiceReport
  include ActiveModel::Model

  # TIME_FORMAT = "%m/%d/%Y".freeze

  attr_accessor :user, :time_zone_name

  validates :user, presence: true

  validate :filters_are_valid

  class << self
    def reflect_on_association(*)
      nil
    end

    private

    def register_filter_class(filter_class)
      define_filter_reader filter_class
      define_filter_builder filter_class
      define_filter_attributes_setter filtter_class
    end

    def define_filter_reader(filter_class)
      define_method :"#{filter_class.key.pluralize}" do
        filters.select { |filter| filter.is_a? filter_class }
      end
    end

    def define_filter_builder(filter_class)
      define_method :"build_#{filter_class.key.pluralize}" do |attributes = {}|
        filter_class.new attributes
      end
    end

    def define_filter_attributes_setter(filter_class)
      define_method :"#{filter_class.key.pluralize}_attributes=" do |filters_attributes|
        filters_attributes.each do |_, filter_attributes|
          add_filter public_send(:"build_#{filter_class.key.pluralize}", filter_attributes) unless filter_attributes[:destroy].present?
        end
      end
    end
  end

  register_filter_class ContactFilter
  register_filter_class OrderDateFilter
  register_filter_class PaymentTypeFilter
  register_filter_class ShipmentDateFilter
  register_filter_class StatusFilter

  def user_id=(user_id)
    if user_id.present?
      self.user = User.finduser_id
    else
      self.user = nil
    end
  end

  def user_id
    user.try :id
  end

  def add_filter(filter)
    filters << filter
  end

  def filters
    @filters ||= []
  end

  def invoices
    all_invoices.select { |invoice| includes?(invoice) }
  end

  private

  def includes?(invoice)
    filters.all? { |filter| filter.matches?(invoice) }
  end

  def all_invoices
    if user.present?
      user.invoices.preload(*required_associations)
    else
      []
    end
  end

  def required_associations
    filters.flat_map(&:required_associations).uniq
  end

  def all_filters_are_valid
    errors.add(:filters, "have errors") unless filters.all? { |filter| filter.valid? }
  end
end
