require 'application_system_test_case'

class AdmissionsTest < ApplicationSystemTestCase
  setup do
    @admission = admissions(:one)
  end

  test 'visiting the index' do
    visit admissions_url
    assert_selector 'h1', text: 'Admissions'
  end

  test 'should create admission' do
    visit admissions_url
    click_on 'New admission'

    fill_in 'Country', with: @admission.country
    fill_in 'Date of birth', with: @admission.date_of_birth
    fill_in 'Email', with: @admission.email
    fill_in 'Firstname', with: @admission.firstname
    fill_in 'Lastname', with: @admission.lastname
    fill_in 'Lga', with: @admission.lga
    fill_in 'Other names', with: @admission.other_names
    fill_in 'Phone', with: @admission.phone
    fill_in 'Photo', with: @admission.photo
    fill_in 'State', with: @admission.state
    fill_in 'Transcript', with: @admission.transcript
    click_on 'Create Admission'

    assert_text 'Admission was successfully created'
    click_on 'Back'
  end

  test 'should update Admission' do
    visit admission_url(@admission)
    click_on 'Edit this admission', match: :first

    fill_in 'Country', with: @admission.country
    fill_in 'Date of birth', with: @admission.date_of_birth
    fill_in 'Email', with: @admission.email
    fill_in 'Firstname', with: @admission.firstname
    fill_in 'Lastname', with: @admission.lastname
    fill_in 'Lga', with: @admission.lga
    fill_in 'Other names', with: @admission.other_names
    fill_in 'Phone', with: @admission.phone
    fill_in 'Photo', with: @admission.photo
    fill_in 'State', with: @admission.state
    fill_in 'Transcript', with: @admission.transcript
    click_on 'Update Admission'

    assert_text 'Admission was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Admission' do
    visit admission_url(@admission)
    click_on 'Destroy this admission', match: :first

    assert_text 'Admission was successfully destroyed'
  end
end
