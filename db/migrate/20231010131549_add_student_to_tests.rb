class AddStudentToTests < ActiveRecord::Migration[7.0]
  def change
    add_reference :tests, :student, null: false, foreign_key: true
  end
end
