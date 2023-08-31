json.extract! staff, :id, :photo, :title, :firstname, :lastname, :email, :phone, :dateofbirth, :country, :state, :lga,
              :street, :department, :role, :salary, :hire_date, :created_at, :updated_at
json.url staff_url(staff, format: :json)
