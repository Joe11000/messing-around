require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /sessions" do
    it "works! (now write some real specs)" do
      user = FactoryBot.create :user
      # byebug
      # expect(request.cookies[:user_id]).to eq nil

      post sessions_path
      expect(response).to have_http_status(200)
      expect(response.cookies[:user_id]).to eq user.id
    end
  end
end
