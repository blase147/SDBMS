class AddStaffIdToClassrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :classrooms, :staff, null: false, foreign_key: true
  end
end
