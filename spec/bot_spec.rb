require 'rails_helper'

RSpec.describe Listener do
  before(:each) do
    allow(WelcomeService).to(receive(:perform).and_return({ success: true }))
    allow(AnswerService).to(receive(:perform).and_return({ success: true }))
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

  private

  def fake_message
    message = { "text" => "Hello, world" }
    Facebook::Messenger::Incoming::Message.new(message)
  end
end
