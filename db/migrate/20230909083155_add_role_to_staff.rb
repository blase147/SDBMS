class AddRoleToStaff < ActiveRecord::Migration[7.0]
  def change
    add_column :staffs, :role, :string
  end
end
