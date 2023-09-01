require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:one)
  end

  test 'should get index' do
    get reports_url
    assert_response :success
  end

  test 'should get new' do
    get new_report_url
    assert_response :success
  end

  test 'should create report' do
    assert_difference('Report.count') do
      post reports_url,
           params: { report: { academic_session: @report.academic_session, class: @report.class, firstname: @report.firstname,
                               lastname: @report.lastname, other_names: @report.other_names, photo: @report.photo, term: @report.term, type: @report.type } }
    end

    assert_redirected_to report_url(Report.last)
  end

  test 'should show report' do
    get report_url(@report)
    assert_response :success
  end

  test 'should get edit' do
    get edit_report_url(@report)
    assert_response :success
  end

  test 'should update report' do
    patch report_url(@report),
          params: { report: { academic_session: @report.academic_session, class: @report.class, firstname: @report.firstname,
                              lastname: @report.lastname, other_names: @report.other_names, photo: @report.photo, term: @report.term, type: @report.type } }
    assert_redirected_to report_url(@report)
  end

  test 'should destroy report' do
    assert_difference('Report.count', -1) do
      delete report_url(@report)
    end

    assert_redirected_to reports_url
  end
end
