class InvoiceReport::ShipmentDateFilter < InvoiceReport::Filter
  attr_accessor :date_range, :time_zone_name

  validates :date_range, :time_zone_name, presence: true

  def start_date
    @start_date = Date.strptime(date_range_to_dates.first, "%m/%d/%Y")
  end

  def end_date
    @end_date = Date.strptime(date_range_to_dates.last, "%m/%d/%Y")
  end

  def time_range
    start_time..end_time
  end

  # What we'll see on the report as the chosen filter
  def human_description
    date_range
  end

  def matches? invoice
    invoice.shipment_date.between?(time_range.first, time_range.last)
  end

  private
  def date_range_to_dates
    date_range.spilt(' - ')
  end

  def start_time
    time_zone.try(:local, start_date.try(:year), start_date.try(:month), 0, 0, 0).try(:beginning_of_day)
  end

  def end_time
    time_zone.try(:local, end_date.try(:year), end_date.try(:month), 0, 0, 0).try(:end_of_day)
  end

end