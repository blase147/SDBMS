json.extract! recruitment, :id, :firstname, :lastname, :other_names, :date_of_birth, :country, :state, :lga,
              :qualification, :prof_certs, :cover_letter, :photo, :created_at, :updated_at
json.url recruitment_url(recruitment, format: :json)
