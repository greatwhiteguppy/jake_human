require 'test_helper'

class BrightIdeasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bright_ideas_new_url
    assert_response :success
  end

  test "should get show" do
    get bright_ideas_show_url
    assert_response :success
  end

end
