class ReplaceEmailWithAdmissionNumberAndAddDetailsToAttendances < ActiveRecord::Migration[7.0]
  def change
        # Remove the 'email' column
        remove_column :attendances, :email

        # Add new columns
        add_column :attendances, :admission_number, :string
        add_column :attendances, :age, :integer
        add_column :attendances, :gender, :string
        add_column :attendances, :presence, :boolean
        add_column :attendances, :health_condition, :text
        add_column :attendances, :arrival_time, :time
        add_column :attendances, :departure_time, :time       
  end
end
