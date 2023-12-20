class CreateJoinTableAttendanceStudent < ActiveRecord::Migration[7.0]
  def change
    create_join_table :attendances, :students do |t|
      # t.index [:attendance_id, :student_id]
      # t.index [:student_id, :attendance_id]
    end
  end
end
