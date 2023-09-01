class CreateVisitors < ActiveRecord::Migration[7.0]
  def change
    create_table :visitors do |t|
      t.string :firstname
      t.string :lastname
      t.string :other_names
      t.string :phone
      t.string :email
      t.string :enquiry

      t.timestamps
    end
  end
end
