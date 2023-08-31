class Classroom < ApplicationRecord
    belongs_to:students
    belongs_to :staff
    has_many :students, dependent: :destroy
   
end
