require "test_helper"

class TaggablesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get taggables_index_url
    assert_response :success
  end

  test "should get show" do
    get taggables_show_url
    assert_response :success
  end
end
