class UserMailer < ApplicationMailer
  default from: 'jgnoonan27@gmail.com'
  layout 'mailer'

  def welcome_email
    @user = params[:user]
    @url = da_bears_url
    mail(to: 'jgnoonan27@gmail.com', subject: 'See what the bears are up to.')
  end
end

# ActionMailer methods
# headers[:field_name] = 'value'
# attachments[:image_name] = File.open('file-name.jpg')
# mail(to: '', subject: '')

#  inline attachments
# def welcome_email
  # attachments.inline['image_name.jpg'] = File.read('/path/to/image.jpg')
