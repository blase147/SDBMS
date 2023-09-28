class Classroom < ApplicationRecord
  belongs_to :staff
  has_many :students, dependent: :destroy
  has_many :staffs
end
