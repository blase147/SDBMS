require 'test_helper'

class SubjectstsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subjectst = subjectsts(:one)
  end

  test 'should get index' do
    get subjectsts_url
    assert_response :success
  end

  test 'should get new' do
    get new_subjectst_url
    assert_response :success
  end

  test 'should create subjectst' do
    assert_difference('Subjectst.count') do
      post subjectsts_url, params: { subjectst: { name: @subjectst.name } }
    end

    assert_redirected_to subjectst_url(Subjectst.last)
  end

  test 'should show subjectst' do
    get subjectst_url(@subjectst)
    assert_response :success
  end

  test 'should get edit' do
    get edit_subjectst_url(@subjectst)
    assert_response :success
  end

  test 'should update subjectst' do
    patch subjectst_url(@subjectst), params: { subjectst: { name: @subjectst.name } }
    assert_redirected_to subjectst_url(@subjectst)
  end

  test 'should destroy subjectst' do
    assert_difference('Subjectst.count', -1) do
      delete subjectst_url(@subjectst)
    end

    assert_redirected_to subjectsts_url
  end
end
