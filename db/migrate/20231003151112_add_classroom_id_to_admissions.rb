class AddClassroomIdToAdmissions < ActiveRecord::Migration[7.0]
  def change
    add_reference :admissions, :classroom, null: true, foreign_key: true
  end
end
