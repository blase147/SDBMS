class AddAdmissionIdToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :admission_id, :integer
    add_index :attendances, :admission_id
  end
end
