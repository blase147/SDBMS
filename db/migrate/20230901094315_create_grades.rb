class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.string :name
      t.string :type
      t.string :value

      t.timestamps
    end
  end
end
