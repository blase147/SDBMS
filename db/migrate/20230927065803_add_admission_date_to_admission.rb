class AddAdmissionDateToAdmission < ActiveRecord::Migration[7.0]
  def change
    add_column :admissions, :admission_date, :date
  end
end
