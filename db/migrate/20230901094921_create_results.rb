class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.string :firstname
      t.string :lastname
      t.string :other_names
      t.string :photo
      t.string :type
      t.string :class
      t.string :subject
      t.string :ca
      t.string :project
      t.string :homework
      t.string :total

      t.timestamps
    end
  end
end
