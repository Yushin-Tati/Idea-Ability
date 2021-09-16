require 'test_helper'

class Admins::PlansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_plans_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_plans_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_plans_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_plans_update_url
    assert_response :success
  end

end
