json.extract! expenditure, :id, :subject, :description, :amount, :created_at, :updated_at
json.url expenditure_url(expenditure, format: :json)
