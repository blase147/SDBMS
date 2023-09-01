json.extract! correspondence, :id, :firstname, :lastname, :other_names, :photo, :teachers_remark, :created_at,
              :updated_at
json.url correspondence_url(correspondence, format: :json)
