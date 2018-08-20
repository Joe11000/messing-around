require 'rails_helper'

RSpec.describe "dogs/edit", type: :view do
  before(:each) do
    @dog = assign(:dog, Dog.create!(
      :name => "MyString",
      :owner => nil
    ))
  end

  it "renders the edit dog form" do
    render

    assert_select "form[action=?][method=?]", dog_path(@dog), "post" do

      assert_select "input[name=?]", "dog[name]"

      assert_select "input[name=?]", "dog[owner_id]"
    end
  end
end
