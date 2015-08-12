require 'rails_helper'

RSpec.describe "Tasks", type: :feature do

  let!(:list) { create(:list1) }
  let!(:task1) { create(:task1) }

  before(:each) do
    list.tasks << task1
  end

  it "status can be changed" do

    visit root_path

    within(".list") do
      click_link_or_button('List 1')
    end

    expect(page).to have_content('incomplete')

    click_link_or_button('incomplete')

    expect(page).to have_content('complete')
  end
end
