class AddDepartmentToStaff < ActiveRecord::Migration[7.0]
  def change
    add_reference :staffs, :department, null: false, foreign_key: true
  end
end
