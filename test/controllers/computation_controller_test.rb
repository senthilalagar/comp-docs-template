require 'test_helper'

class ComputationControllerTest < ActionDispatch::IntegrationTest
  test "should get format" do
    get computation_format_url
    assert_response :success
  end

  test "should get index" do
    get computation_index_url
    assert_response :success
  end

end
