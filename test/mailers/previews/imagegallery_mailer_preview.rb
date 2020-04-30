# Preview all emails at http://localhost:3000/rails/mailers/imagegallery_mailer
class ImagegalleryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/imagegallery_mailer/new_imagegallery
  def new_imagegallery
    imagegallery= Imagegallery.last
    ImagegalleryMailer.new_imagegallery(imagegallery)
  end

end
   