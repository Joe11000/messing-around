class DevelopmentEmailInterceptor
  def self.delivering_email(message)
    byebug
    message.to = ['jgnoonan27+intercepted@gmail.com']
  end
end
