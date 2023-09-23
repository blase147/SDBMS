class RemoveFieldsFromParents < ActiveRecord::Migration[7.0]
  def change
    remove_column :parents, :firstname, :string
    remove_column :parents, :lastname, :string
    remove_column :parents, :phone, :string
    remove_column :parents, :dateofbirth, :date
    remove_column :parents, :country, :string
    remove_column :parents, :state, :string
    remove_column :parents, :lga, :string
    remove_column :parents, :street, :string
  end
end
