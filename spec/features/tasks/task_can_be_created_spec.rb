require 'rails_helper'

RSpec.describe "Tasks", type: :feature do

  it "can be created on a list" do
    list = List.create(title: 'Tom\'s List')
    visit root_path

    click_link_or_button('Tom\'s List')
    click_link_or_button('Add Task')

    fill_in('task[title]', with: 'Title')
    fill_in('task[body]', with: 'Body')
    fill_in('task[due_date]', with: '10/10/2015')
    click_link_or_button('Create Task')

    expect(current_path).to eq(list_path(list.id))
    expect(page).to have_content('Title')
    expect(page).to have_content('Body')
    expect(page).to have_content('2015-10-10')
  end
end
