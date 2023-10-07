class AddStudentIdToClassrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :classrooms, :student, null: true, foreign_key: true
  end
end
