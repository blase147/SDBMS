class RemoveColumnsFromAttendances < ActiveRecord::Migration[7.0]
  def change
    remove_column :attendances, :firstname
    remove_column :attendances, :lastname
    remove_column :attendances, :other_names
    remove_column :attendances, :phone
    remove_column :attendances, :photo
    remove_column :attendances, :admission_number
    remove_column :attendances, :age
    remove_column :attendances, :gender
  end
end
