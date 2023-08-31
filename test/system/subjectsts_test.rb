require 'application_system_test_case'

class SubjectstsTest < ApplicationSystemTestCase
  setup do
    @subjectst = subjectsts(:one)
  end

  test 'visiting the index' do
    visit subjectsts_url
    assert_selector 'h1', text: 'Subjectsts'
  end

  test 'should create subjectst' do
    visit subjectsts_url
    click_on 'New subjectst'

    fill_in 'Name', with: @subjectst.name
    click_on 'Create Subjectst'

    assert_text 'Subjectst was successfully created'
    click_on 'Back'
  end

  test 'should update Subjectst' do
    visit subjectst_url(@subjectst)
    click_on 'Edit this subjectst', match: :first

    fill_in 'Name', with: @subjectst.name
    click_on 'Update Subjectst'

    assert_text 'Subjectst was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Subjectst' do
    visit subjectst_url(@subjectst)
    click_on 'Destroy this subjectst', match: :first

    assert_text 'Subjectst was successfully destroyed'
  end
end
