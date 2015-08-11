require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:list){
    List.create(id: 1, title: "Title")
  }

  let(:task){
    Task.create(title: "Title",
                body: "Body",
                status: "incomplete",
                due_date: "August 14, 2015",
                list_id: list.id )
  }

  it "is valid" do
    expect(task).to be_valid
  end

  it "is invalid without a title" do
    task.title = ""
    expect(task).to_not be_valid
  end

  it 'belongs to a list' do
    expect(task.list).to eq(list)
  end

end
