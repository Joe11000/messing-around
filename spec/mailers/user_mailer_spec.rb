require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @recipient = FactoryBot.create :user
    @mail = UserMailer.with(user: @recipient).welcome_email.deliver
  end

  after :each do
    ActionMailer::Base.deliveries.clear
  end

  describe 'notify' do

    it 'renders the headers' do
      expect(@mail.subject).to eq 'See what the bears are up to.'
      expect(@mail.to).to eq ['jgnoonan27@gmail.com']
      expect(@mail.from).to eq ['jgnoonan27@gmail.com']
    end

    context 'html portion' do
      it 'renders the body' do
        expect(@mail.body.encoded).to match /#{@recipient.name}/
        expect(@mail.body.encoded).to match /#{da_bears_url}/
      end
    end

    xcontext 'text portion' do

      it 'renders the body' do
        byebug
        expect(@mail.body.encoded).to eq (<<~EMAIL_BODY
                                          Welcome to example.com, #{@recipient.name}
                                          ===============================================

                                          You have successfully signed up and you should totally check out what the bears are up to at #{da_bears_url}

                                          Have a great day!
                                          EMAIL_BODY
                                        )

      end
    end

    it 'should be sent' do
      ActionMailer::Base.deliveries.count.should == 1
    end
  end
end
