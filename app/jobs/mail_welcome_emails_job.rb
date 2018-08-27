class MailWelcomeEmailsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    byebug
    args[:users].each do |user|
      UserMailer.with(user: user).welcome_email.deliver
    end
  end
end
