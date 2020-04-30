class ImagegalleryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.imagegallery_mailer.new_imagegallery.subject
  #
  def new_imagegallery(imagegallery)      
    mail to: imagegallery.user.email, subject: 'New Post Added'
  end
end
