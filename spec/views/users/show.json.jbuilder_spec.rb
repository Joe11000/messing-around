require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  let(:json) { JSON.parse(response.body) }
  let(:user) { FactoryBot.create :user, :dog_sitter }

  context 'GET users#show.json' do
    it '' do
      get :show, format: :json, params: {id: user}

      expect(json).to eq( user.slice(:id, :email, :password, :name, :birthday) )
    end
  end
end



