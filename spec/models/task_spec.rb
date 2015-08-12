require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:list){
    List.create(id: 1, title: "Title")
  }

  let(:task){
    Task.create(title: "Title",
                body: "Body",
                start_date: "August 15, 2015",
                due_date: "August 20, 2015",
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

  it "has a relationship with lists" do
    expect(task).to respond_to(:list)
  end

  it "is invalid with a date earlier than the current date" do
    task.start_date = "August 11, 2010"
    expect(task).to_not be_valid
  end

  it "starts with an incomplete status" do
    expect(task.status).to eq("incomplete")
  end

end
