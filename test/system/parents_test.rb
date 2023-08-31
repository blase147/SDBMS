require "application_system_test_case"

class ParentsTest < ApplicationSystemTestCase
  setup do
    @parent = parents(:one)
  end

  test "visiting the index" do
    visit parents_url
    assert_selector "h1", text: "Parents"
  end

  test "should create parent" do
    visit parents_url
    click_on "New parent"

    fill_in "Country", with: @parent.country
    fill_in "Dateofbirth", with: @parent.dateofbirth
    fill_in "Email", with: @parent.email
    fill_in "Firstname", with: @parent.firstname
    fill_in "Lastname", with: @parent.lastname
    fill_in "Lga", with: @parent.lga
    fill_in "Occupation", with: @parent.occupation
    fill_in "Phone", with: @parent.phone
    fill_in "Photo", with: @parent.photo
    fill_in "State", with: @parent.state
    fill_in "Street", with: @parent.street
    fill_in "Title", with: @parent.title
    click_on "Create Parent"

    assert_text "Parent was successfully created"
    click_on "Back"
  end

  test "should update Parent" do
    visit parent_url(@parent)
    click_on "Edit this parent", match: :first

    fill_in "Country", with: @parent.country
    fill_in "Dateofbirth", with: @parent.dateofbirth
    fill_in "Email", with: @parent.email
    fill_in "Firstname", with: @parent.firstname
    fill_in "Lastname", with: @parent.lastname
    fill_in "Lga", with: @parent.lga
    fill_in "Occupation", with: @parent.occupation
    fill_in "Phone", with: @parent.phone
    fill_in "Photo", with: @parent.photo
    fill_in "State", with: @parent.state
    fill_in "Street", with: @parent.street
    fill_in "Title", with: @parent.title
    click_on "Update Parent"

    assert_text "Parent was successfully updated"
    click_on "Back"
  end

  test "should destroy Parent" do
    visit parent_url(@parent)
    click_on "Destroy this parent", match: :first

    assert_text "Parent was successfully destroyed"
  end
end
