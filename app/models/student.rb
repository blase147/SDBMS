class Student < ApplicationRecord
  has_many  :parents
  belongs_to :classroom
  belongs_to :admission
  has_many :subjects, dependent: :destroy
  has_many :tests, dependent: :destroy
  has_many :exams, dependent: :destroy
end
