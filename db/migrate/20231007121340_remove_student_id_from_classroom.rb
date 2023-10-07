class RemoveStudentIdFromClassroom < ActiveRecord::Migration[7.0]
  def change
    remove_reference :classrooms, :student, foreign_key: true
  end
end
