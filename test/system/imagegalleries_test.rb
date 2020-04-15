require "application_system_test_case"

class ImagegalleriesTest < ApplicationSystemTestCase
  setup do
    @imagegallery = imagegalleries(:one)
  end

  test "visiting the index" do
    visit imagegalleries_url
    assert_selector "h1", text: "Imagegalleries"
  end

  test "creating a Imagegallery" do
    visit imagegalleries_url
    click_on "New Imagegallery"

    fill_in "Caption", with: @imagegallery.caption
    fill_in "Title", with: @imagegallery.title
    click_on "Create Imagegallery"

    assert_text "Imagegallery was successfully created"
    click_on "Back"
  end

  test "updating a Imagegallery" do
    visit imagegalleries_url
    click_on "Edit", match: :first

    fill_in "Caption", with: @imagegallery.caption
    fill_in "Title", with: @imagegallery.title
    click_on "Update Imagegallery"

    assert_text "Imagegallery was successfully updated"
    click_on "Back"
  end

  test "destroying a Imagegallery" do
    visit imagegalleries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Imagegallery was successfully destroyed"
  end
end
