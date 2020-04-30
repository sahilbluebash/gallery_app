class ImagegalleryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.imagegallery_mailer.new_imagegallery.subject
  #
  def new_imagegallery(imagegallery)      
    mail to: imagegallery.user.email, subject: 'POST CREATED'
  end

  def destroy_imagegallery(imagegallery)      
    mail to: imagegallery.user.email, subject: 'POST DELETED'
  end

  def edit_imagegallery(imagegallery)      
    mail to: imagegallery.user.email, subject: 'POST EDITED'
  end

end
