json.extract! parent, :id, :photo, :title, :firstname, :lastname, :email, :phone, :dateofbirth, :country, :state, :lga, :street, :occupation, :created_at, :updated_at
json.url parent_url(parent, format: :json)
