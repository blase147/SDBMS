require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "should create student" do
    visit students_url
    click_on "New student"

    fill_in "Admission date", with: @student.admission_date
    fill_in "Admission number", with: @student.admission_number
    fill_in "Class", with: @student.class
    fill_in "Country", with: @student.country
    fill_in "Dateofbirth", with: @student.dateofbirth
    check "Disabilities" if @student.disabilities
    fill_in "Disability type", with: @student.disability_type
    fill_in "Email", with: @student.email
    fill_in "Fathers fullname", with: @student.fathers_fullname
    fill_in "Firstname", with: @student.firstname
    fill_in "Lastname", with: @student.lastname
    fill_in "Lga", with: @student.lga
    fill_in "Mothers fullname", with: @student.mothers_fullname
    fill_in "Phone", with: @student.phone
    fill_in "Photo", with: @student.photo
    fill_in "State", with: @student.state
    fill_in "Street", with: @student.street
    fill_in "Title", with: @student.title
    fill_in "Transcript", with: @student.transcript
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "should update Student" do
    visit student_url(@student)
    click_on "Edit this student", match: :first

    fill_in "Admission date", with: @student.admission_date
    fill_in "Admission number", with: @student.admission_number
    fill_in "Class", with: @student.class
    fill_in "Country", with: @student.country
    fill_in "Dateofbirth", with: @student.dateofbirth
    check "Disabilities" if @student.disabilities
    fill_in "Disability type", with: @student.disability_type
    fill_in "Email", with: @student.email
    fill_in "Fathers fullname", with: @student.fathers_fullname
    fill_in "Firstname", with: @student.firstname
    fill_in "Lastname", with: @student.lastname
    fill_in "Lga", with: @student.lga
    fill_in "Mothers fullname", with: @student.mothers_fullname
    fill_in "Phone", with: @student.phone
    fill_in "Photo", with: @student.photo
    fill_in "State", with: @student.state
    fill_in "Street", with: @student.street
    fill_in "Title", with: @student.title
    fill_in "Transcript", with: @student.transcript
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "should destroy Student" do
    visit student_url(@student)
    click_on "Destroy this student", match: :first

    assert_text "Student was successfully destroyed"
  end
end
