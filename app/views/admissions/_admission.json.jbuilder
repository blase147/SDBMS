json.extract! admission, :id, :firstname, :lastname, :other_names, :date_of_birth, :country, :state, :lga, :phone,
              :email, :transcript, :photo, :created_at, :updated_at
json.url admission_url(admission, format: :json)
