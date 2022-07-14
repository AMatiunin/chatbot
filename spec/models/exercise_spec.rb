require 'rails_helper'

RSpec.describe Exercise, type: :model do
  subject { described_class.new(name: 'name', description: 'some description', conversation: conversation) }
  let(:conversation) { Conversation.new(user: user) }
  let(:user) { User.new }

  it "valid with name and description" do
    expect(subject).to be_valid
  end

  it "not valid without description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
