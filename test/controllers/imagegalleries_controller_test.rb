require 'test_helper'

class ImagegalleriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imagegallery = imagegalleries(:one)
  end

  test "should get index" do
    get imagegalleries_url
    assert_response :success
  end

  test "should get new" do
    get new_imagegallery_url
    assert_response :success
  end

  test "should create imagegallery" do
    assert_difference('Imagegallery.count') do
      post imagegalleries_url, params: { imagegallery: { caption: @imagegallery.caption, title: @imagegallery.title } }
    end

    assert_redirected_to imagegallery_url(Imagegallery.last)
  end

  test "should show imagegallery" do
    get imagegallery_url(@imagegallery)
    assert_response :success
  end

  test "should get edit" do
    get edit_imagegallery_url(@imagegallery)
    assert_response :success
  end

  test "should update imagegallery" do
    patch imagegallery_url(@imagegallery), params: { imagegallery: { caption: @imagegallery.caption, title: @imagegallery.title } }
    assert_redirected_to imagegallery_url(@imagegallery)
  end

  test "should destroy imagegallery" do
    assert_difference('Imagegallery.count', -1) do
      delete imagegallery_url(@imagegallery)
    end

    assert_redirected_to imagegalleries_url
  end
end
