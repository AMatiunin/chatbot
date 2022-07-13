class WelcomeService < ApplicationService
  attr_reader :message

  def call
    @message = arg
    init_question(message)
  end

  def init_question(message)
    message.reply(
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
    )
  end
end