class AddColumnsToStaffs < ActiveRecord::Migration[7.0]
  def change
    add_column :staffs, :teacher, :boolean
    add_column :staffs, :administrator, :boolean
    add_column :staffs, :human_resource, :boolean
    add_column :staffs, :frontdesk, :boolean
    add_column :staffs, :chef, :boolean
    add_column :staffs, :accountant, :boolean
    add_column :staffs, :librarian, :boolean
    add_column :staffs, :principal, :boolean
    add_column :staffs, :vice_principal, :boolean
    add_column :staffs, :bursar, :boolean
    add_column :staffs, :guidance_counselor, :boolean
    add_column :staffs, :nurse, :boolean
    add_column :staffs, :security, :boolean
    add_column :staffs, :cleaner, :boolean
    add_column :staffs, :driver, :boolean
    add_column :staffs, :other, :boolean
  end
end
