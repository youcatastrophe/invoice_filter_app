require "application_system_test_case"

class PaymentTypesTest < ApplicationSystemTestCase
  setup do
    @payment_type = payment_types(:one)
  end

  test "visiting the index" do
    visit payment_types_url
    assert_selector "h1", text: "Payment Types"
  end

  test "creating a Payment type" do
    visit payment_types_url
    click_on "New Payment Type"

    fill_in "Name", with: @payment_type.name
    fill_in "Tag", with: @payment_type.tag
    click_on "Create Payment type"

    assert_text "Payment type was successfully created"
    click_on "Back"
  end

  test "updating a Payment type" do
    visit payment_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @payment_type.name
    fill_in "Tag", with: @payment_type.tag
    click_on "Update Payment type"

    assert_text "Payment type was successfully updated"
    click_on "Back"
  end

  test "destroying a Payment type" do
    visit payment_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Payment type was successfully destroyed"
  end
end
