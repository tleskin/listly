require 'rails_helper'

RSpec.describe "Tasks", type: :feature do

  let!(:list1) { create(:list1) }
  let!(:task1) { create(:task1) }

  before(:each) do
    list1.tasks << task1
  end

  it "can be deleted from a list" do

    visit list_path(list1.id)

    expect(page).to have_content('Title 1')

    click_link_or_button('Edit Task')
    fill_in('task[title]', with: 'My New Title')
    click_link_or_button('Edit Task')

    expect(page).to_not have_content('Task 1')
    expect(page).to have_content('My New Title')
  end
end
