class AddNullConstraintsToForeignKeys < ActiveRecord::Migration[7.0]
  def change
    change_column_null :active_storage_attachments, :blob_id, false
    change_column_null :active_storage_variant_records, :blob_id, false
    change_column_null :admissions, :classroom_id, false
    change_column_null :staffs, :classroom_id, false
    change_column_null :attendances, :classroom_id, false
    change_column_null :classrooms, :student_id, false
    change_column_null :students, :attendance_id, false
  end
end