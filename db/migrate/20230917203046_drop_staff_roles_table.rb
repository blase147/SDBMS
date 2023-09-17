class DropStaffRolesTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :staffs_roles
  end
end
