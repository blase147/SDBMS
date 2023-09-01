require 'application_system_test_case'

class FeesTest < ApplicationSystemTestCase
  setup do
    @fee = fees(:one)
  end

  test 'visiting the index' do
    visit fees_url
    assert_selector 'h1', text: 'Fees'
  end

  test 'should create fee' do
    visit fees_url
    click_on 'New fee'

    fill_in 'Description', with: @fee.description
    fill_in 'Name', with: @fee.name
    fill_in 'Value', with: @fee.value
    click_on 'Create Fee'

    assert_text 'Fee was successfully created'
    click_on 'Back'
  end

  test 'should update Fee' do
    visit fee_url(@fee)
    click_on 'Edit this fee', match: :first

    fill_in 'Description', with: @fee.description
    fill_in 'Name', with: @fee.name
    fill_in 'Value', with: @fee.value
    click_on 'Update Fee'

    assert_text 'Fee was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Fee' do
    visit fee_url(@fee)
    click_on 'Destroy this fee', match: :first

    assert_text 'Fee was successfully destroyed'
  end
end
