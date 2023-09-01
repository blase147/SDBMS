json.extract! report, :id, :firstname, :lastname, :other_names, :photo, :type, :class, :term, :academic_session,
              :created_at, :updated_at
json.url report_url(report, format: :json)
