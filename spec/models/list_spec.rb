require 'rails_helper'

RSpec.describe List, type: :model do

  let(:list){
    List.create(id: 1, title: "Title")
  }

  it "has a title" do
    expect(list).to be_valid
  end

  it "is invalid without a title" do
    list.title = ""
    expect(list).to_not be_valid
  end
end
