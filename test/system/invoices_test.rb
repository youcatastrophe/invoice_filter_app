require "application_system_test_case"

class InvoicesTest < ApplicationSystemTestCase
  setup do
    @invoice = invoices(:one)
  end

  test "visiting the index" do
    visit invoices_url
    assert_selector "h1", text: "Invoices"
  end

  test "creating a Invoice" do
    visit invoices_url
    click_on "New Invoice"

    fill_in "Billing address", with: @invoice.billing_address_id
    fill_in "Carrier", with: @invoice.carrier_id
    fill_in "Contact", with: @invoice.contact_id
    fill_in "Invoice number", with: @invoice.invoice_number
    fill_in "Order date", with: @invoice.order_date
    fill_in "Payment type", with: @invoice.payment_type_id
    fill_in "Shipment date", with: @invoice.shipment_date
    fill_in "Shipping address", with: @invoice.shipping_address_id
    fill_in "Shipping handling", with: @invoice.shipping_handling
    fill_in "Subtotal", with: @invoice.subtotal
    fill_in "Tax", with: @invoice.tax
    fill_in "Total", with: @invoice.total
    click_on "Create Invoice"

    assert_text "Invoice was successfully created"
    click_on "Back"
  end

  test "updating a Invoice" do
    visit invoices_url
    click_on "Edit", match: :first

    fill_in "Billing address", with: @invoice.billing_address_id
    fill_in "Carrier", with: @invoice.carrier_id
    fill_in "Contact", with: @invoice.contact_id
    fill_in "Invoice number", with: @invoice.invoice_number
    fill_in "Order date", with: @invoice.order_date
    fill_in "Payment type", with: @invoice.payment_type_id
    fill_in "Shipment date", with: @invoice.shipment_date
    fill_in "Shipping address", with: @invoice.shipping_address_id
    fill_in "Shipping handling", with: @invoice.shipping_handling
    fill_in "Subtotal", with: @invoice.subtotal
    fill_in "Tax", with: @invoice.tax
    fill_in "Total", with: @invoice.total
    click_on "Update Invoice"

    assert_text "Invoice was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice" do
    visit invoices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice was successfully destroyed"
  end
end
