class CreateAdmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :admissions do |t|
      t.string :firstname
      t.string :lastname
      t.string :other_names
      t.date :date_of_birth
      t.string :country
      t.string :state
      t.string :lga
      t.string :phone
      t.string :email
      t.string :transcript
      t.string :photo

      t.timestamps
    end
  end
end
