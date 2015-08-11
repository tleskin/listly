require 'rails_helper'

RSpec.describe List, type: :model do
  it "has a title" do
    list = List.create(title: 'test')

    expect(list).to be_valid
  end

  it "is invalid without a title" do
    list = List.create(title: 'test')
    list.title = ""

    expect(list).to_not be_valid
  end
end
