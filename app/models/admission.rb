class Admission < ApplicationRecord
  has_many :students
  has_many :parents
  has_one_attached :photo
  has_one_attached :p_photo
  has_one_attached :transcript
  belongs_to :classroom, optional: true
  has_many :attendances, dependent: :destroy

  attribute :admission_status, :boolean, default: false

  # Student validations
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :other_names, presence: true
  validates :date_of_birth, presence: true
  validates :grade_level, presence: true
  validates :admission_date, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :lga, presence: true
  validates :phone, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email format' }
  validates :transcript, presence: true
  validates :photo, presence: true
  validates :primary_language, presence: true
  validates :other_languages, presence: true
  validates :religion, presence: true
  validates :current_school_name, presence: true
  validates :current_class_year, presence: true
  validates :type_of_school, presence: true
  validates :current_school_address, presence: true

  # Parent/Guardian validations
  validates :p_photo, presence: true
  validates :relationship_with_applicant, presence: true
  validates :p_title, presence: true
  validates :p_full_name, presence: true
  validates :p_date_of_birth, presence: true
  validates :p_country_of_birth, presence: true
  validates :p_nationality, presence: true
  validates :p_home_address, presence: true
  validates :p_mailing_address, presence: true
  validates :p_occupation, presence: true
  validates :p_mobile_phone_number, presence: true
  validates :p_employer_name, presence: true
  validates :p_employer_address, presence: true
  validates :p_work_telephone_number, presence: true
  validates :p_email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email format' }
end
