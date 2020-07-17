require 'test_helper'

class SubcontractorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subcontractors_index_url
    assert_response :success
  end

  test "should get create" do
    get subcontractors_create_url
    assert_response :success
  end

  test "should get show" do
    get subcontractors_show_url
    assert_response :success
  end

end
