require 'application_system_test_case'

class StaffsTest < ApplicationSystemTestCase
  setup do
    @staff = staffs(:one)
  end

  test 'visiting the index' do
    visit staffs_url
    assert_selector 'h1', text: 'Staffs'
  end

  test 'should create staff' do
    visit staffs_url
    click_on 'New staff'

    fill_in 'Country', with: @staff.country
    fill_in 'Dateofbirth', with: @staff.dateofbirth
    fill_in 'Department', with: @staff.department
    fill_in 'Email', with: @staff.email
    fill_in 'Firstname', with: @staff.firstname
    fill_in 'Hire date', with: @staff.hire_date
    fill_in 'Lastname', with: @staff.lastname
    fill_in 'Lga', with: @staff.lga
    fill_in 'Phone', with: @staff.phone
    fill_in 'Photo', with: @staff.photo
    fill_in 'Role', with: @staff.role
    fill_in 'Salary', with: @staff.salary
    fill_in 'State', with: @staff.state
    fill_in 'Street', with: @staff.street
    fill_in 'Title', with: @staff.title
    click_on 'Create Staff'

    assert_text 'Staff was successfully created'
    click_on 'Back'
  end

  test 'should update Staff' do
    visit staff_url(@staff)
    click_on 'Edit this staff', match: :first

    fill_in 'Country', with: @staff.country
    fill_in 'Dateofbirth', with: @staff.dateofbirth
    fill_in 'Department', with: @staff.department
    fill_in 'Email', with: @staff.email
    fill_in 'Firstname', with: @staff.firstname
    fill_in 'Hire date', with: @staff.hire_date
    fill_in 'Lastname', with: @staff.lastname
    fill_in 'Lga', with: @staff.lga
    fill_in 'Phone', with: @staff.phone
    fill_in 'Photo', with: @staff.photo
    fill_in 'Role', with: @staff.role
    fill_in 'Salary', with: @staff.salary
    fill_in 'State', with: @staff.state
    fill_in 'Street', with: @staff.street
    fill_in 'Title', with: @staff.title
    click_on 'Update Staff'

    assert_text 'Staff was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Staff' do
    visit staff_url(@staff)
    click_on 'Destroy this staff', match: :first

    assert_text 'Staff was successfully destroyed'
  end
end
