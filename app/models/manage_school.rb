class ManageSchool < ApplicationRecord
  has_one_attached :school_logo
  has_one_attached :school_photo
  has_one_attached :hos_signature



  # Validations
  validates :school_name, presence: true, length: { maximum: 255 }
  # validates :school_phone_number, presence: true, length: { maximum: 255 }
  validates :school_address, presence: true, length: { maximum: 255 }
  validates :school_motto, presence: true, length: { maximum: 255 }
  validates :school_vision, presence: true, length: { maximum: 255 }
  validates :school_mission, presence: true, length: { maximum: 255 }
  validates :school_logo, presence: true
  validates :school_photo, presence: true
  validates :hos_signature, presence: true
  validates :academic_session, presence: true, length: { maximum: 255 }
  validates :academic_session_start_date, presence: true
  validates :academic_session_end_date, presence: true
  validates :school_phone_number, presence: true, length: { maximum: 255 }
  validates :school_email, presence: true, length: { maximum: 255 }
  validates :school_website, presence: true, length: { maximum: 255 }
  validates :term, presence: true, length: { maximum: 255 }
  validates :term_start_date, presence: true, length: { maximum: 255 }
  validates :term_end_date, presence: true, length: { maximum: 255 }
  validates :school_motto, presence: true, length: { maximum: 255 }

  # Other model associations or methods can be defined here.
end
