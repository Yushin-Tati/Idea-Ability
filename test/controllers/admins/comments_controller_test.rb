require 'test_helper'

class Admins::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_comments_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_comments_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_comments_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_comments_update_url
    assert_response :success
  end

end
