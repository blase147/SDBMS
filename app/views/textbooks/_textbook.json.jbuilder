json.extract! textbook, :id, :title, :description, :level, :publisher, :year_of_publication, :authur, :created_at,
              :updated_at
json.url textbook_url(textbook, format: :json)
