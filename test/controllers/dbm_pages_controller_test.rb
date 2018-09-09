require 'test_helper'

class DbmPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dbm_pages_index_url
    assert_response :success
  end

  test "should get show" do
    get dbm_pages_show_url
    assert_response :success
  end

  test "should get new" do
    get dbm_pages_new_url
    assert_response :success
  end

  test "should get create" do
    get dbm_pages_create_url
    assert_response :success
  end

  test "should get edit" do
    get dbm_pages_edit_url
    assert_response :success
  end

  test "should get update" do
    get dbm_pages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dbm_pages_destroy_url
    assert_response :success
  end

end
