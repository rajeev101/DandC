require "test_helper"

class SuperSubCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get super_sub_categories_index_url
    assert_response :success
  end
end
