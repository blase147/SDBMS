class RenameStudentsClassInput < ActiveRecord::Migration[7.0]
  def change
    rename_column :students, :class, :grade_level
  end
end
