class RemoveRegNumberFromAdmissions < ActiveRecord::Migration[7.0]
  def up
    remove_columns :admissions, :reg_number
  end
end
