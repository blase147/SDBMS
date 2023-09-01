json.extract! result, :id, :firstname, :lastname, :other_names, :photo, :type, :class, :subject, :ca, :project,
              :homework, :total, :created_at, :updated_at
json.url result_url(result, format: :json)
