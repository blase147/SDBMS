class RemoveAdmissionIdFromAttendances < ActiveRecord::Migration[7.0]
  def change
    remove_reference :attendances, :admission, foreign_key: true
  end
end
