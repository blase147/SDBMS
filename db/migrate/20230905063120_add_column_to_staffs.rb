class AddColumnToStaffs < ActiveRecord::Migration[7.0]
  def change
    add_column :staffs, :designation, :string
  end
end
