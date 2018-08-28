require Rails.root.join('lib', 'dev_email_interceptor')

if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentEmailInterceptor)
end
