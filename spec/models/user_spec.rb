require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Username') }

  it "valid with name" do
    expect(subject).to be_valid
  end

  it "still valid without name" do
    subject.name = nil
    expect(subject).to be_valid
  end
end