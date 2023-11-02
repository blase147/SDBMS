class Attendance < ApplicationRecord
  belongs_to :classroom, optional: true
  belongs_to :student, optional: true
  belongs_to :admission, optional: true
end
