class AddAssignTeacherToClassroom < ActiveRecord::Migration[7.0]
  def change
    add_column :classrooms, :assign_teacher, :string
  end
end
