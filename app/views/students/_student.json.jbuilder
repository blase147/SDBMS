json.extract! student, :id, :photo, :title, :firstname, :lastname, :email, :phone, :dateofbirth, :country, :state,
              :lga, :street, :class, :admission_number, :transcript, :fathers_fullname, :mothers_fullname, :admission_date, :disabilities, :disability_type, :created_at, :updated_at
json.url student_url(student, format: :json)
