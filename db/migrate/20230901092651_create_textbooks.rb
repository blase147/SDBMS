class CreateTextbooks < ActiveRecord::Migration[7.0]
  def change
    create_table :textbooks do |t|
      t.string :title
      t.string :description
      t.string :level
      t.string :publisher
      t.string :year_of_publication
      t.string :authur

      t.timestamps
    end
  end
end
