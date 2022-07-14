require 'rails_helper'

RSpec.describe Conversation, type: :model do
  subject { described_class.new(user: user) }

  let(:user) { User.new }

  it "is valid with user" do
    expect(subject).to be_valid
  end

  it "is not valid without a user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end
end
