class AddAttendanceIdToClassrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :classrooms, :attendance, null: true, foreign_key: true
  end
end
