require 'application_system_test_case'

class ResultsTest < ApplicationSystemTestCase
  setup do
    @result = results(:one)
  end

  test 'visiting the index' do
    visit results_url
    assert_selector 'h1', text: 'Results'
  end

  test 'should create result' do
    visit results_url
    click_on 'New result'

    fill_in 'Ca', with: @result.ca
    fill_in 'Class', with: @result.class
    fill_in 'Firstname', with: @result.firstname
    fill_in 'Homework', with: @result.homework
    fill_in 'Lastname', with: @result.lastname
    fill_in 'Other names', with: @result.other_names
    fill_in 'Photo', with: @result.photo
    fill_in 'Project', with: @result.project
    fill_in 'Subject', with: @result.subject
    fill_in 'Total', with: @result.total
    fill_in 'Type', with: @result.type
    click_on 'Create Result'

    assert_text 'Result was successfully created'
    click_on 'Back'
  end

  test 'should update Result' do
    visit result_url(@result)
    click_on 'Edit this result', match: :first

    fill_in 'Ca', with: @result.ca
    fill_in 'Class', with: @result.class
    fill_in 'Firstname', with: @result.firstname
    fill_in 'Homework', with: @result.homework
    fill_in 'Lastname', with: @result.lastname
    fill_in 'Other names', with: @result.other_names
    fill_in 'Photo', with: @result.photo
    fill_in 'Project', with: @result.project
    fill_in 'Subject', with: @result.subject
    fill_in 'Total', with: @result.total
    fill_in 'Type', with: @result.type
    click_on 'Update Result'

    assert_text 'Result was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Result' do
    visit result_url(@result)
    click_on 'Destroy this result', match: :first

    assert_text 'Result was successfully destroyed'
  end
end
