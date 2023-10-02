class AddCompletedAtToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :completed_at, :datetime
  end
end
