class Admission < ApplicationRecord
  has_many :students
  has_many :parents

    # Student validations
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :date_of_birth, presence: true
    validates :country, presence: true
    validates :state, presence: true
    validates :lga, presence: true
    validates :phone, presence: true
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email format" }
    validates :transcript, presence: true
    validates :photo, presence: true
    validates :primary_language, presence: true
    validates :religion, presence: true
    
    # Parent/Guardian validations
    validates :relationship_with_applicant, presence: true
    validates :p_full_name, presence: true
    validates :p_date_of_birth, presence: true
    validates :p_country_of_birth, presence: true
    validates :p_nationality, presence: true
    validates :p_home_address, presence: true
    validates :p_mailing_address, presence: true
    validates :p_mobile_phone_number, presence: true
    validates :p_email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email format" }
  
    # Add validations for other parent/guardian fields as needed  
  end
  