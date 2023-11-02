class Subject < ApplicationRecord
  # belongs_to :student

  validates :grade_level, presence: true
  validates :name, presence: true
  validates :subject_code, presence: true
end
