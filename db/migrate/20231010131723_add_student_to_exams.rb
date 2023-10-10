class AddStudentToExams < ActiveRecord::Migration[7.0]
  def change
    add_reference :exams, :student, null: false, foreign_key: true
  end
end
