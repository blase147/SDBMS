class AddColumnsToManageSchools < ActiveRecord::Migration[7.0]
  def change
    add_column :manage_schools, :school_email, :string
    add_column :manage_schools, :school_website, :string
  end 
end
