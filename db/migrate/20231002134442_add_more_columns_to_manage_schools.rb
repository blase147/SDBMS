class AddMoreColumnsToManageSchools < ActiveRecord::Migration[7.0]
  def change
        add_column :manage_schools, :academic_session, :string
        add_column :manage_schools, :academic_session_start_date, :date
        add_column :manage_schools, :academic_session_end_date, :date
        add_column :manage_schools, :term, :string
        add_column :manage_schools, :term_start_date, :date
        add_column :manage_schools, :term_end_date, :date
  end
end