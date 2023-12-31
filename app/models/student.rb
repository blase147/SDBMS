class Student < ApplicationRecord
  has_many :parents
  belongs_to :classroom
  belongs_to :admission
  has_many :attendances

  has_many :subjects, dependent: :destroy
  has_many :tests, dependent: :destroy
  has_many :exams, dependent: :destroy

  validates :admission_number, presence: true
  validates :registration_date, presence: true
  validates :classroom_id, presence: true
  validates :admission_id, presence: true

  def fullname
    "#{admission&.firstname} #{admission&.lastname}".strip
  end
  
end
