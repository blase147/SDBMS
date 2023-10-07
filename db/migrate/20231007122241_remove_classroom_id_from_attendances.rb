class RemoveClassroomIdFromAttendances < ActiveRecord::Migration[7.0]
  def change
    remove_reference :attendances, :classroom, foreign_key: true
  end
end
