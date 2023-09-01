json.extract! visitor, :id, :firstname, :lastname, :other_names, :phone, :email, :enquiry, :created_at, :updated_at
json.url visitor_url(visitor, format: :json)
