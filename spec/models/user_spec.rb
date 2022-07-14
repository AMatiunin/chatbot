require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Username') }

  it "valid with name and description" do
    expect(subject).to be_valid
  end

  it "still valid without count_of_repeat and relax" do
    subject.name = nil
    expect(subject).to be_valid
  end
end