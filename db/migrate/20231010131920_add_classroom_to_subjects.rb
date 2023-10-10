class AddClassroomToSubjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :subjects, :classroom, null: true, foreign_key: true
  end
end
