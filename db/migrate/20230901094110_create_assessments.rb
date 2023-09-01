class CreateAssessments < ActiveRecord::Migration[7.0]
  def change
    create_table :assessments do |t|
      t.string :type
      t.string :subject
      t.string :class
      t.string :term
      t.string :academic_session

      t.timestamps
    end
  end
end
