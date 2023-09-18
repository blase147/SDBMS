class AddfieldsToManageSchools < ActiveRecord::Migration[7.0]
  def change
    add_column :manage_schools, :school_motto, :string
    add_column :manage_schools, :school_address, :string
    add_column :manage_schools, :school_phone_number, :string
    add_column :manage_schools, :school_vision, :text
    add_column :manage_schools, :school_mission, :text
    add_column :manage_schools, :school_photo, :binary
    add_column :manage_schools, :hos_signature, :binary
  end
end
