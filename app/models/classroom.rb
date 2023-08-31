class Classroom < ApplicationRecord
  belongs_to :staff
  has_many :students, dependent: :destroy
end
