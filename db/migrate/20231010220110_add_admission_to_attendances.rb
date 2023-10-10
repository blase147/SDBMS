class AddAdmissionToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_reference :attendances, :admission, null: true, foreign_key: true
  end
end
