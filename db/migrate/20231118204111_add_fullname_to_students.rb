class AddFullnameToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :fullname, :string
  end
end
