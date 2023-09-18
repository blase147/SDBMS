class RenameNametToSchoolName < ActiveRecord::Migration[7.0]
  def change
    rename_column :manage_schools, :namet, :school_name
  end
end
