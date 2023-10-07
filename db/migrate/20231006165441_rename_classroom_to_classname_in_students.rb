class RenameClassroomToClassnameInStudents < ActiveRecord::Migration[7.0]
  def change
    rename_column :students, :classroom, :classname
  end
end
