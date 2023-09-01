json.extract! assessment, :id, :type, :subject, :class, :term, :academic_session, :created_at, :updated_at
json.url assessment_url(assessment, format: :json)
