class Student < ApplicationRecord
  has_many  :parents
  belongs_to :classroom
  # has_one :classroom
  belongs_to :admission
  has_many :subjects, dependent: :destroy
  has_many :tests, dependent: :destroy
  has_many :exams, dependent: :destroy

  validates :admission_number, presence: true
  validates :registration_date, presence: true
  validates :classroom_id, presence: true
  validates :admission_id, presence: true
  validates :disabilities, presence: true
  validates :disability_type, presence: true
  
  def fullname
    "#{firstname} #{lastname}"
  end
end
