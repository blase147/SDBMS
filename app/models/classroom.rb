class Classroom < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :admissions, dependent: :destroy
  # belongs_to :assign_teacher, class_name: 'Staff', foreign_key: 'staff_id'
  has_many :subjects, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :grade_level, presence: true
  validates :size, presence: true
  validates :assign_teacher, presence: true
end
