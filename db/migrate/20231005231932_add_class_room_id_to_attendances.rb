class AddClassRoomIdToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_reference :attendances, :classroom, null: true, foreign_key: true
  end
end
