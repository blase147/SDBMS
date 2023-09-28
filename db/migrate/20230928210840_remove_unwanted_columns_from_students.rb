class RemoveUnwantedColumnsFromStudents < ActiveRecord::Migration[7.0]
  def up
    remove_columns :students, :photo, :title, :email, :phone, :dateofbirth, :country, :state, :lga, :street, :transcript, :fathers_fullname, :mothers_fullname
  end
end
