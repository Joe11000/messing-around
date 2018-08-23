require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    @user = FactoryBot.create :user, :dog_sitter
  end

  it "renders a list of users" do
    render

  end

end
