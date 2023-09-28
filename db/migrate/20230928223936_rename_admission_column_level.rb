class RenameAdmissionColumnLevel < ActiveRecord::Migration[7.0]
  def change
    rename_column :admissions, :level, :grade_level
  end
end
