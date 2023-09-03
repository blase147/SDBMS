class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :photo, :string
    add_column :users, :phone, :string
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :lga, :string
  end
end
