require 'test_helper'

class MealCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meal_categories_index_url
    assert_response :success
  end

  test "should get show" do
    get meal_categories_show_url
    assert_response :success
  end

  test "should get new" do
    get meal_categories_new_url
    assert_response :success
  end

  test "should get edit" do
    get meal_categories_edit_url
    assert_response :success
  end

end
