require 'rails_helper'

RSpec.describe "Lists", type: :feature do
  describe "lists" do
    it "allows a user to create new lists" do
      visit root_path

      click_link_or_button("Create New List")
      
      fill_in('list[title]', with: 'Tom\'s List')
      click_link_or_button('Create List')

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Tom\'s List')
    end
  end
end
