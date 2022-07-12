require 'rails_helper'

RSpec.describe Listener do
  FakeMessage = Struct.new(:sender, :recipient, :timestamp, :message)

  describe 'Bot#on(message)' do
    before do
      allow(::AnswerService).to(receive(:perform).and_return({ success: true }))
    end

    it 'responds with a message' do
      Bot.trigger(:message, fake_message)
      expect(Bot).to call(AnswerService)
    end
  end

  private

  def fake_message
    sender = { "id" => "1234" }
    recipient = { "id" => "5678" }
    timestamp = 1528049653543
    message = { "text" => "Hello, world" }
    FakeMessage.new(sender, recipient, timestamp, message)
  end
end
