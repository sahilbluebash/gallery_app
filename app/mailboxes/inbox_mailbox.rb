class InboxMailbox < ApplicationMailbox
  
  before_processing :find_user

  def process
    return unless @user

    Apartment::Tenant.switch @user.account.subdomain do
      content = EmailContentExtractorCommand.new(mail).call
      EntityCreatorCommand.new(@user, title: mail.subject, content: content.result).call if content.success?
    end
  end

  private

  def find_user
    @user = User.find_by(email: mail.from)
  end

end
