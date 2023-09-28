class RemoveGradeLevelFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :grade_level, :string
  end
end
