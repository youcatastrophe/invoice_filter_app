json.extract! invoice, :id, :contact_id, :order_date, :shipment_date, :shipping_address_id, :billing_address_id, :payment_type_id, :carrier_id, :total, :tax, :shipping_handling, :subtotal, :invoice_number, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
