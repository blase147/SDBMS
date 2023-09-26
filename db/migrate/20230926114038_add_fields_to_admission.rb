class AddFieldsToAdmission < ActiveRecord::Migration[7.0]
  def change
    add_column :admissions, :p_photo, :string
    add_column :admissions, :p_title, :string
    # add_column :admissions, :p_email, :string
    add_column :admissions, :p_occupation, :string
    add_column :admissions, :relationship_with_applicant, :string
    add_column :admissions, :p_full_name, :string
    add_column :admissions, :p_country_of_birth, :string
    add_column :admissions, :p_date_of_birth, :date
    add_column :admissions, :p_nationality, :string
    add_column :admissions, :p_home_address, :text
    add_column :admissions, :p_mailing_address, :text
    add_column :admissions, :p_mobile_phone_number, :string
    add_column :admissions, :p_employer_name, :string
    add_column :admissions, :p_employer_address, :text
    add_column :admissions, :p_work_telephone_number, :string
    add_column :admissions, :p_email, :string
  end
end
