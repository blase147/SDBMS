class RemoveStaffIdFromClassroom < ActiveRecord::Migration[7.0]
  def change
    remove_reference :classrooms, :staff, foreign_key: true
  end
end
