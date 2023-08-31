class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
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
      t.string :class
      t.string :admission_number
      t.text :transcript
      t.string :fathers_fullname
      t.string :mothers_fullname
      t.date :admission_date
      t.boolean :disabilities
      t.string :disability_type

      t.timestamps
    end
  end
end
