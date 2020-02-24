json.extract! contact, :id, :user_id, :prefix, :first_name, :last_name, :middle_name, :birthday, :mobile_phone, :email, :home_phone, :work_phone, :address_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
