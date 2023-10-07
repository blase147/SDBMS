class RemoveClassroomIdFromAdmissions < ActiveRecord::Migration[7.0]
  def change
    remove_reference :admissions, :classroom, foreign_key: true
  end
end
