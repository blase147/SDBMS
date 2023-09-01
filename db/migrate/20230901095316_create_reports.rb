class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :firstname
      t.string :lastname
      t.string :other_names
      t.string :photo
      t.string :type
      t.string :class
      t.string :term
      t.string :academic_session

      t.timestamps
    end
  end
end
