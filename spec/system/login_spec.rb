require "rails_helper"

RSpec.describe 'login', type: :system do
  before do
    driven_by(:selenium_chrome)
    # driven_by(:rack_test)
  end
  it '' do
    visit root_path
    expect(page.current_path).to eq root_path
  end
end


# require "rails_helper"

# RSpec.describe "Widget management", :type => :system do


#   it "enables me to create widgets" do
#     visit "/widgets/new"

#     fill_in "Name", :with => "My Widget"
#     click_button "Create Widget"

#     expect(page).to have_text("Widget was successfully created.")
#   end
# end
