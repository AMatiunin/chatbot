require 'rails_helper'

RSpec.describe WelcomeService do
  describe '#perform' do
    context 'when we send something to bot'

    subject { described_class.perform(fake_message) }

    let(:fake_message) { Facebook::Messenger::Incoming::Message.new(message) }
    let(:message) { { payload: { 'sender' => '123', "text" => "Hello, world" } } }

    let(:responce) do
      {
        attachment: {
          type: 'template',
          payload: {
            template_type: 'button',
            text: 'Ready to get started?',
            buttons: [
              { type: 'postback', title: 'Lets go!', payload: 'START' },
              { type: 'postback', title: 'No thanks', payload: 'EXIT' }
            ]
          }
        }
      }
    end

    it 'expected the choose to continue' do
      is_expected.to eq(responce)
    end
  end
end
