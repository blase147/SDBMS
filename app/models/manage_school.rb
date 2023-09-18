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

    # Other model associations or methods can be defined here.
  end
  