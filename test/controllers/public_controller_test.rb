require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_show_url
    assert_response :success
  end
end
