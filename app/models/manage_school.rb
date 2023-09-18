class ManageSchool < ApplicationRecord
    # Validations
    validates :school_name, presence: true, length: { maximum: 255 }
    validates :school_phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "must be a 11-digit number" }
    validates :school_address, presence: true, length: { maximum: 255 }
    validates :school_motto, presence: true, length: { maximum: 255 }
    validates :school_vision, presence: true, length: { maximum: 255 }
    validates :school_mission, presence: true, length: { maximum: 255 }
    validates :school_logo, presence: true
    validates :school_photo, presence: true
    validates :hos_signature, presence: true

    # Other model associations or methods can be defined here.
  end
  