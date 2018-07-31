require 'rails_helper'

RSpec.describe "dogs/new", type: :view do
  before(:each) do
    assign(:dog, Dog.new(
      :name => "MyString",
      :age => 1,
      :owner => nil
    ))
  end

  it "renders new dog form" do
    render

    assert_select "form[action=?][method=?]", dogs_path, "post" do

      assert_select "input[name=?]", "dog[name]"

      assert_select "input[name=?]", "dog[age]"

      assert_select "input[name=?]", "dog[owner_id]"
    end
  end
end
