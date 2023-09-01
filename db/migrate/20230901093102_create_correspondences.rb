class CreateCorrespondences < ActiveRecord::Migration[7.0]
  def change
    create_table :correspondences do |t|
      t.string :firstname
      t.string :lastname
      t.string :other_names
      t.string :photo
      t.string :teachers_remark

      t.timestamps
    end
  end
end
