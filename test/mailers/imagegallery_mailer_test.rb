require 'test_helper'

class ImagegalleryMailerTest < ActionMailer::TestCase
  test "new_imagegallery" do
    mail = ImagegalleryMailer.new_imagegallery
    assert_equal "New imagegallery", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
