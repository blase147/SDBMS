class Classroom < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :admissions, dependent: :destroy

  # validates :student_id, presence: true
  validates :name, presence: true, uniqueness: true
  validates :grade_level, presence: true
  validates :size, presence: true
  validates :assign_teacher, presence: true
  # validates :student_id, presence: true
end
