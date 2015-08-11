require 'rails_helper'

RSpec.describe "Tasks", type: :feature do

  let!(:list) { create(:list1) }

  it "can be created on a list" do

    visit root_path

    click_link_or_button('List 1')
    click_link_or_button('Add Task')

    fill_in('task[title]', with: 'Title')
    fill_in('task[body]', with: 'Body')
    fill_in('task[start_date]', with: '10/10/2016')
    fill_in('task[due_date]', with: '10/11/2016')
    click_link_or_button('Create Task')

    expect(current_path).to eq(list_path(list.id))
    expect(page).to have_content('Title')
    expect(page).to have_content('Body')
    expect(page).to have_content('Start Date: 2016-10-10')
  end
end
