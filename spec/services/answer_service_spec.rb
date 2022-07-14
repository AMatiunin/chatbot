require 'rails_helper'

RSpec.describe AnswerService do
  describe '#perform' do
    context 'when we send postback START to bot'

    subject { described_class.perform(fake_postback) }

    let(:fake_postback) { Facebook::Messenger::Incoming::Postback.new(start_payload) }
    let(:start_payload) { { payload: "START" } }

    before do
      allow(fake_postback).to(receive(:payload).and_return(start_payload[:payload]))
    end

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

    it 'expected the answer' do
      is_expected.to eq(responce_to_start)
    end
  end

  describe 'Bot#on(postback)' do
    context 'when user reply by clicking some button'

    let(:fake_postback) { Facebook::Messenger::Incoming::Postback.new(else_payload) }
    let(:else_payload) { { 'sender' => '456', 'recipient' => '123', payload: 'ELSE' } }

    before(:each) do
      allow(Facebook::Messenger::Bot).to(receive(:deliver).and_return({ success: true }))
      allow(fake_postback).to(receive(:payload).and_return(else_payload[:payload]))
    end

    it 'should run AnswerService' do
      expect(WorkoutService).to receive(:perform)
      Bot.trigger(:postback, fake_postback)
    end
  end
end

