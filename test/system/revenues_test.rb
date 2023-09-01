require 'application_system_test_case'

class RevenuesTest < ApplicationSystemTestCase
  setup do
    @revenue = revenues(:one)
  end

  test 'visiting the index' do
    visit revenues_url
    assert_selector 'h1', text: 'Revenues'
  end

  test 'should create revenue' do
    visit revenues_url
    click_on 'New revenue'

    fill_in 'Amount', with: @revenue.amount
    fill_in 'Description', with: @revenue.description
    fill_in 'Subject', with: @revenue.subject
    click_on 'Create Revenue'

    assert_text 'Revenue was successfully created'
    click_on 'Back'
  end

  test 'should update Revenue' do
    visit revenue_url(@revenue)
    click_on 'Edit this revenue', match: :first

    fill_in 'Amount', with: @revenue.amount
    fill_in 'Description', with: @revenue.description
    fill_in 'Subject', with: @revenue.subject
    click_on 'Update Revenue'

    assert_text 'Revenue was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Revenue' do
    visit revenue_url(@revenue)
    click_on 'Destroy this revenue', match: :first

    assert_text 'Revenue was successfully destroyed'
  end
end
