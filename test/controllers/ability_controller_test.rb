require 'test_helper'

class AbilityControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ability_index_url
    assert_response :success
  end

  test "should get show" do
    get ability_show_url
    assert_response :success
  end

  test "should get new" do
    get ability_new_url
    assert_response :success
  end

  test "should get create" do
    get ability_create_url
    assert_response :success
  end

  test "should get edit" do
    get ability_edit_url
    assert_response :success
  end

  test "should get update" do
    get ability_update_url
    assert_response :success
  end

  test "should get dastroy" do
    get ability_dastroy_url
    assert_response :success
  end

end
