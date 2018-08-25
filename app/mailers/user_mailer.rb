class UserMailer < ApplicationMailer
  default from: 'jgnoonan27@gmail.com'
  layout 'mailer'

  def welcome_email
    @user = params[:user]
    @url = da_bears_url
    @recipients = 'jgnoonan27@gmail.com' # or ['jgnoonan27@gmail.com', 'jgnoonan27@gmail.com'] or User.pluck :email
    mail(to: 'jgnoonan27@gmail.com', subject: 'See what the bears are up to.', cc: '', bcc: '')
  end

  def multiple_welcome_emails
    params[:users].each do |user|
      UserMailer.welcome_email.with(user: user)
    end
  end
end

# ActionMailer methods
# headers[:field_name] = 'value'
# attachments[:image_name] = File.open('file-name.jpg')
# mail(to: '', subject: '')

#  inline attachments
# def welcome_email
  # attachments.inline['image_name.jpg'] = File.read('/path/to/image.jpg')
# end
# then in view
# <%= image_tag attachments['image.jpg'].url %>
