json.extract! attendance, :id, :firstname, :lastname, :other_names, :phone, :email, :photo, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
