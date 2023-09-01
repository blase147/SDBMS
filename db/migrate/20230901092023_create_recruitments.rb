class CreateRecruitments < ActiveRecord::Migration[7.0]
  def change
    create_table :recruitments do |t|
      t.string :firstname
      t.string :lastname
      t.string :other_names
      t.date :date_of_birth
      t.string :country
      t.string :state
      t.string :lga
      t.string :qualification
      t.string :prof_certs
      t.string :cover_letter
      t.string :photo

      t.timestamps
    end
  end
end
