class CreateManageSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :manage_schools do |t|
      t.string :namet
      t.string :moto
      t.string :logo

      t.timestamps
    end
  end
end
