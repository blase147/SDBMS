require 'test_helper'

class CorrespondencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @correspondence = correspondences(:one)
  end

  test 'should get index' do
    get correspondences_url
    assert_response :success
  end

  test 'should get new' do
    get new_correspondence_url
    assert_response :success
  end

  test 'should create correspondence' do
    assert_difference('Correspondence.count') do
      post correspondences_url,
           params: { correspondence: { firstname: @correspondence.firstname, lastname: @correspondence.lastname,
                                       other_names: @correspondence.other_names, photo: @correspondence.photo, teachers_remark: @correspondence.teachers_remark } }
    end

    assert_redirected_to correspondence_url(Correspondence.last)
  end

  test 'should show correspondence' do
    get correspondence_url(@correspondence)
    assert_response :success
  end

  test 'should get edit' do
    get edit_correspondence_url(@correspondence)
    assert_response :success
  end

  test 'should update correspondence' do
    patch correspondence_url(@correspondence),
          params: { correspondence: { firstname: @correspondence.firstname, lastname: @correspondence.lastname,
                                      other_names: @correspondence.other_names, photo: @correspondence.photo, teachers_remark: @correspondence.teachers_remark } }
    assert_redirected_to correspondence_url(@correspondence)
  end

  test 'should destroy correspondence' do
    assert_difference('Correspondence.count', -1) do
      delete correspondence_url(@correspondence)
    end

    assert_redirected_to correspondences_url
  end
end
