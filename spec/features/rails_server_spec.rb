require File.expand_path(File.dirname(__FILE__) + "/features_helper")

feature "Seting up RSpec and Capybara for feature testing" do
  scenario "Visiting the Site's root path" do
    visit root_path
    expect(page).to have_content("Welcome to Lendger")
  end
end
