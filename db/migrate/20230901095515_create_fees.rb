class CreateFees < ActiveRecord::Migration[7.0]
  def change
    create_table :fees do |t|
      t.string :name
      t.string :description
      t.string :value

      t.timestamps
    end
  end
end
