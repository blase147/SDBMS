require 'application_system_test_case'

class RecruitmentsTest < ApplicationSystemTestCase
  setup do
    @recruitment = recruitments(:one)
  end

  test 'visiting the index' do
    visit recruitments_url
    assert_selector 'h1', text: 'Recruitments'
  end

  test 'should create recruitment' do
    visit recruitments_url
    click_on 'New recruitment'

    fill_in 'Country', with: @recruitment.country
    fill_in 'Cover letter', with: @recruitment.cover_letter
    fill_in 'Date of birth', with: @recruitment.date_of_birth
    fill_in 'Firstname', with: @recruitment.firstname
    fill_in 'Lastname', with: @recruitment.lastname
    fill_in 'Lga', with: @recruitment.lga
    fill_in 'Other names', with: @recruitment.other_names
    fill_in 'Photo', with: @recruitment.photo
    fill_in 'Prof certs', with: @recruitment.prof_certs
    fill_in 'Qualification', with: @recruitment.qualification
    fill_in 'State', with: @recruitment.state
    click_on 'Create Recruitment'

    assert_text 'Recruitment was successfully created'
    click_on 'Back'
  end

  test 'should update Recruitment' do
    visit recruitment_url(@recruitment)
    click_on 'Edit this recruitment', match: :first

    fill_in 'Country', with: @recruitment.country
    fill_in 'Cover letter', with: @recruitment.cover_letter
    fill_in 'Date of birth', with: @recruitment.date_of_birth
    fill_in 'Firstname', with: @recruitment.firstname
    fill_in 'Lastname', with: @recruitment.lastname
    fill_in 'Lga', with: @recruitment.lga
    fill_in 'Other names', with: @recruitment.other_names
    fill_in 'Photo', with: @recruitment.photo
    fill_in 'Prof certs', with: @recruitment.prof_certs
    fill_in 'Qualification', with: @recruitment.qualification
    fill_in 'State', with: @recruitment.state
    click_on 'Update Recruitment'

    assert_text 'Recruitment was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Recruitment' do
    visit recruitment_url(@recruitment)
    click_on 'Destroy this recruitment', match: :first

    assert_text 'Recruitment was successfully destroyed'
  end
end
