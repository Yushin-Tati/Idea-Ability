require 'test_helper'

class Admins::AbilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_abilities_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_abilities_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_abilities_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_abilities_update_url
    assert_response :success
  end

end
