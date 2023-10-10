class AddStudentToSubjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :subjects, :student, null: true, foreign_key: true
  end
end
