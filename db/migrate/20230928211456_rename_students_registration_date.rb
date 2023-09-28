class RenameStudentsRegistrationDate < ActiveRecord::Migration[7.0]
  def change
    rename_column :students, :admission_date, :registration_date
  end
end
