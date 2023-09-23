class AddFieldsToParents < ActiveRecord::Migration[7.0]
  def change
    add_column :parents, :relationship_with_applicant, :string
    add_column :parents, :full_name, :string
    add_column :parents, :country_of_birth, :string
    add_column :parents, :date_of_birth, :date
    add_column :parents, :nationality, :string
    add_column :parents, :home_address, :text
    add_column :parents, :mailing_address, :text
    add_column :parents, :mobile_phone_number, :string
    add_column :parents, :employer_name, :string
    add_column :parents, :employer_address, :text
    add_column :parents, :work_telephone_number, :string
    add_column :parents, :parent_email, :string
  end
end
