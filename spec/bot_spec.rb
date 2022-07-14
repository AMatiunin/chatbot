require 'rails_helper'

RSpec.describe Listener do
  let(:fake_message) { Facebook::Messenger::Incoming::Message.new(message) }
  let(:message) { { 'recipient' => '123' } }

  before(:each) do
    allow(Facebook::Messenger::Bot).to(receive(:deliver).and_return({ success: true }))
  end

  describe 'Bot#on(message)' do
    context 'when user send first message to bot'

    it 'should run WelcomeService' do
      expect(WelcomeService).to receive(:perform)
      Bot.trigger(:message, fake_message)
    end
  end

  describe 'Bot#on(postback)' do
    context 'when user reply by clicking some button'

    it 'should run AnswerService' do
      expect(AnswerService).to receive(:perform)
      Bot.trigger(:postback, fake_message)
    end
  end
end
