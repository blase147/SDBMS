class CreateRevenues < ActiveRecord::Migration[7.0]
  def change
    create_table :revenues do |t|
      t.string :subject
      t.string :description
      t.string :amount

      t.timestamps
    end
  end
end
