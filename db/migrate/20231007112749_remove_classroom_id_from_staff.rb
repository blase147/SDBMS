class RemoveClassroomIdFromStaff < ActiveRecord::Migration[7.0]
  def change
    remove_reference :staffs, :classroom, foreign_key: true
  end
end
