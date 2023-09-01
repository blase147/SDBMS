require 'application_system_test_case'

class TextbooksTest < ApplicationSystemTestCase
  setup do
    @textbook = textbooks(:one)
  end

  test 'visiting the index' do
    visit textbooks_url
    assert_selector 'h1', text: 'Textbooks'
  end

  test 'should create textbook' do
    visit textbooks_url
    click_on 'New textbook'

    fill_in 'Authur', with: @textbook.authur
    fill_in 'Description', with: @textbook.description
    fill_in 'Level', with: @textbook.level
    fill_in 'Publisher', with: @textbook.publisher
    fill_in 'Title', with: @textbook.title
    fill_in 'Year of publication', with: @textbook.year_of_publication
    click_on 'Create Textbook'

    assert_text 'Textbook was successfully created'
    click_on 'Back'
  end

  test 'should update Textbook' do
    visit textbook_url(@textbook)
    click_on 'Edit this textbook', match: :first

    fill_in 'Authur', with: @textbook.authur
    fill_in 'Description', with: @textbook.description
    fill_in 'Level', with: @textbook.level
    fill_in 'Publisher', with: @textbook.publisher
    fill_in 'Title', with: @textbook.title
    fill_in 'Year of publication', with: @textbook.year_of_publication
    click_on 'Update Textbook'

    assert_text 'Textbook was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Textbook' do
    visit textbook_url(@textbook)
    click_on 'Destroy this textbook', match: :first

    assert_text 'Textbook was successfully destroyed'
  end
end
