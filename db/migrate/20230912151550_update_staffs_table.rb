class UpdateStaffsTable < ActiveRecord::Migration[7.0]
  def change
    # Remove the old role column
    remove_column :staffs, :role

    # Add the new roles column as an array with a default empty array
    add_column :staffs, :roles, :string, array: true, default: []
  end
end
