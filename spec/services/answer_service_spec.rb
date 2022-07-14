require 'rails_helper'

RSpec.describe AnswerService do
  let(:fake_postback) { Facebook::Messenger::Incoming::Postback.new(postback) }
  let(:postback) { { postback: { payload: "START" } } }

  let(:responce_to_start) do
    {
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button',
          text: "This is the 1 exercise, when you done it, go for another?",
          buttons: [
            { type: 'postback', title: 'Go next', payload: "EXERCISE_2" },
            { type: 'postback', title: 'No', payload: 'EXIT' }
          ]
        }
      }
    }
  end

  describe '#perform' do
    context 'when we send postback START to bot'
    subject { described_class.perform(fake_postback) }

    it 'expected the answer' do
      is_expected.to eq(responce_to_start)
    end
  end
end
