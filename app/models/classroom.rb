class Classroom < ApplicationRecord
  # belongs_to :staff
  has_many :students, class_name: 'Student', foreign_key: 'classroom_id', dependent: :destroy
  # Note: You should only use either `belongs_to` or `has_one`, not both, depending on your association.

  validates :name, presence: true, uniqueness: true
  validates :grade_level, presence: true
  validates :size, presence: true
  # validates :assign_teacher, presence: true
end
