class AddExtraFieldsToAdmission < ActiveRecord::Migration[7.0]
  def change
    add_column :admissions, :admission_status, :boolean
    add_column :admissions, :reg_number, :string
    add_column :admissions, :class, :string
    add_column :admissions, :gender, :string
  end
end
