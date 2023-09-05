class RemoveColumFromStaffs < ActiveRecord::Migration[7.0]
  def change
    remove_column :staffs, :role, :string
  end
end
