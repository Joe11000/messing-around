class MailWelcomeEmailsJob < ApplicationJob
  queue_as :urgent

  def perform(*args)
    # byebug
    users = args[0][:users]

    if users.is_a? Array
      args[0][:users].each do |user|
        run_mailer user
      end
    else
      run_mailer users
    end
  end

  private
    def run_mailer user
      UserMailer.with(user: user).welcome_email.deliver_later(wait_until: 2.minutes.from_now)
    end
end
# MailWelcomeEmailsJob.perform_now(users: User.first)
