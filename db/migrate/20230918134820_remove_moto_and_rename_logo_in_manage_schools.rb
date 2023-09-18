class RemoveMotoAndRenameLogoInManageSchools < ActiveRecord::Migration[7.0]
  def change
    remove_column :manage_schools, :moto, :string
    rename_column :manage_schools, :logo, :school_logo
  end
end
