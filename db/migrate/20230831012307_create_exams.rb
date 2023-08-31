class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :term
      t.string :session
      t.string :class
      t.string :question
      t.string :option

      t.timestamps
    end
  end
end
