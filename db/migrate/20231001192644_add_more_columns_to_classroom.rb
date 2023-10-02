class AddMoreColumnsToClassroom < ActiveRecord::Migration[7.0]
  def change
    # add_column :classrooms, :size, :string
    # add_column :classrooms, :grade_level, :string
    add_column :classrooms, :assign_teacher, :string
  end
end
