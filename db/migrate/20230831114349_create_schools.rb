class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :logo
      t.string :moto

      t.timestamps
    end
  end
end
