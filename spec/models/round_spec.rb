require 'rails_helper'

RSpec.describe Round, type: :model do
  subject { described_class.new(name: 1, count_of_repeat: 2, relax: 10, exercise: exercise) }
  let(:exercise) { Exercise.new(name: 'Some name', description: 'Some description') }

  it "valid with name and description" do
    expect(subject).to be_valid
  end

  it "still valid without count_of_repeat and relax" do
    subject.count_of_repeat = nil
    subject.relax = nil
    expect(subject).to be_valid
  end

  it "not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
