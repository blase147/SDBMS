class AddAdmissionIdToStudents < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :admission, null: false, foreign_key: true
  end
end
