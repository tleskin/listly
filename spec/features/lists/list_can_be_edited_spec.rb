require 'rails_helper'

RSpec.describe "Lists", type: :feature do

  let!(:list) { create(:list1) }

  describe "lists" do
    it "can be deleted" do
      visit root_path

      expect(page).to have_content('List 1')

      click_link_or_button("Edit List")
      fill_in('list[title]', with: 'My New List')
      click_link_or_button('Edit List')

      expect(page).to_not have_content('List 1')
      expect(page).to have_content('My New List')
    end
  end
end
