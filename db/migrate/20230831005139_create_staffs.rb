class CreateStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs do |t|
      t.string :photo
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone
      t.date :dateofbirth
      t.string :country
      t.string :state
      t.string :lga
      t.string :street
      t.string :department
      t.string :role
      t.decimal :salary
      t.date :hire_date

      t.timestamps
    end
  end
end
