require "test_helper"

class EngagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get engagements_create_url
    assert_response :success
  end
end
