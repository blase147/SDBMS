class RemoveAttendanceIdFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_reference :students, :attendance, foreign_key: true
  end
end
