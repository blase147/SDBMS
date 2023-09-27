class RenameClass < ActiveRecord::Migration[7.0]
  def change
    rename_column :admissions, :class, :level
  end
end
