class UpdateClassroomsSetStaffIdNotNull < ActiveRecord::Migration[7.0]
  def up
    Classroom.where(staff_id: nil).update_all(staff_id: 2)
  end

  def down
    # You can add a rollback method if needed
  end
end
