require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference("Student.count") do
      post students_url, params: { student: { admission_date: @student.admission_date, admission_number: @student.admission_number, class: @student.class, country: @student.country, dateofbirth: @student.dateofbirth, disabilities: @student.disabilities, disability_type: @student.disability_type, email: @student.email, fathers_fullname: @student.fathers_fullname, firstname: @student.firstname, lastname: @student.lastname, lga: @student.lga, mothers_fullname: @student.mothers_fullname, phone: @student.phone, photo: @student.photo, state: @student.state, street: @student.street, title: @student.title, transcript: @student.transcript } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { admission_date: @student.admission_date, admission_number: @student.admission_number, class: @student.class, country: @student.country, dateofbirth: @student.dateofbirth, disabilities: @student.disabilities, disability_type: @student.disability_type, email: @student.email, fathers_fullname: @student.fathers_fullname, firstname: @student.firstname, lastname: @student.lastname, lga: @student.lga, mothers_fullname: @student.mothers_fullname, phone: @student.phone, photo: @student.photo, state: @student.state, street: @student.street, title: @student.title, transcript: @student.transcript } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference("Student.count", -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
