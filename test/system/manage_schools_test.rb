require 'application_system_test_case'

class ManageSchoolsTest < ApplicationSystemTestCase
  setup do
    @manage_school = manage_schools(:one)
  end

  test 'visiting the index' do
    visit manage_schools_url
    assert_selector 'h1', text: 'Manage schools'
  end

  test 'should create manage school' do
    visit manage_schools_url
    click_on 'New manage school'

    fill_in 'Logo', with: @manage_school.logo
    fill_in 'Moto', with: @manage_school.moto
    fill_in 'Namet', with: @manage_school.namet
    click_on 'Create Manage school'

    assert_text 'Manage school was successfully created'
    click_on 'Back'
  end

  test 'should update Manage school' do
    visit manage_school_url(@manage_school)
    click_on 'Edit this manage school', match: :first

    fill_in 'Logo', with: @manage_school.logo
    fill_in 'Moto', with: @manage_school.moto
    fill_in 'Namet', with: @manage_school.namet
    click_on 'Update Manage school'

    assert_text 'Manage school was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Manage school' do
    visit manage_school_url(@manage_school)
    click_on 'Destroy this manage school', match: :first

    assert_text 'Manage school was successfully destroyed'
  end
end
