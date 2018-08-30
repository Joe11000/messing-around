require 'rails_helper'

RSpec.describe MailWelcomeEmailsJob, type: :job do
  # before :all do
  #   sidekiq_options retry: 5
  # end
  # fit { is_expected.to be_retryable true }

  describe '#perform_later' do
     it "enques emails to be sent out to a user" do
      user = FactoryBot.create :user
      ActiveJob::Base.queue_adapter = :test

      MailWelcomeEmailsJob.perform_later(user)

      expect(MailWelcomeEmailsJob).to have_been_enqueued
    end

    it { is_expected.to be_processed_in :test_urgent }

    it "enques emails to be sent out to a user" do
      # ActiveJob::Base.queue_adapter = :test
      2.times { FactoryBot.create :user }

      byebug
      MailWelcomeEmailsJob.perform_later(User.last(2))

      # expect(MailWelcomeEmailsJob).to have_been_enqueued
      # expect(MailWelcomeEmailsJob).to be_processed_in :test_urgent
      expect(MailWelcomeEmailsJob).to have_enqueued_sidekiq_job(UserMailer, true)

      # expect(MailWelcomeEmailsJob).to( be_delayed.for(2.seconds) )
    end

  end
end
