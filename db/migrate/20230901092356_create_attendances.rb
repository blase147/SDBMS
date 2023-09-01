class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.string :firstname
      t.string :lastname
      t.string :other_names
      t.string :phone
      t.string :email
      t.string :photo

      t.timestamps
    end
  end
end
