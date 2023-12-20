class Attendance < ApplicationRecord
  belongs_to :classroom, optional: true
  belongs_to :student
  belongs_to :admission, optional: true


  def fullname
    "#{admission&.firstname} #{admission&.lastname}".strip
  end
  
end
