require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { address_id: @contact.address_id, birthday: @contact.birthday, email: @contact.email, first_name: @contact.first_name, home_phone: @contact.home_phone, last_name: @contact.last_name, middle_name: @contact.middle_name, mobile_phone: @contact.mobile_phone, prefix: @contact.prefix, user_id: @contact.user_id, work_phone: @contact.work_phone } }
    end

    assert_redirected_to contact_url(Contact.last)
  end

  test "should show contact" do
    get contact_url(@contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_url(@contact)
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { address_id: @contact.address_id, birthday: @contact.birthday, email: @contact.email, first_name: @contact.first_name, home_phone: @contact.home_phone, last_name: @contact.last_name, middle_name: @contact.middle_name, mobile_phone: @contact.mobile_phone, prefix: @contact.prefix, user_id: @contact.user_id, work_phone: @contact.work_phone } }
    assert_redirected_to contact_url(@contact)
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact)
    end

    assert_redirected_to contacts_url
  end
end
