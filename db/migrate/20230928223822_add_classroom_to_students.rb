class AddClassroomToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :classroom, :string
  end
end
