class AddFieldsToAdmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :admissions, :primary_language, :string
    add_column :admissions, :other_languages, :string
    add_column :admissions, :religion, :string
    add_column :admissions, :current_school_name, :string
    add_column :admissions, :current_class_year, :string
    add_column :admissions, :type_of_school, :string
    add_column :admissions, :current_school_address, :text
  end
end
