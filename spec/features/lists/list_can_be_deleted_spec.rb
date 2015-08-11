require 'rails_helper'

RSpec.describe "Lists", type: :feature do

  let!(:list) { create(:list1) }

  describe "lists" do
    it "can be deleted" do
      visit root_path

      expect(page).to have_content('List 1')

      click_link_or_button("Delete List")

      expect(page).to_not have_content('List 1')
    end
  end
end
