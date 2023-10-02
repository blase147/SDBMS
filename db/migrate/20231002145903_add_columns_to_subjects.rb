class AddColumnsToSubjects < ActiveRecord::Migration[7.0]
  def change
    add_column :subjects, :grade_level, :string
    add_column :subjects, :subject_code, :string
  end
end
