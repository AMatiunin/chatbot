class AnswerService < ApplicationService
  attr_reader :message

  def call(message)
    @message = message
    #TODO Add logic for Answering due to incoming message
  end

  def standard_reply
    message.reply(
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button',
          text: 'Human, wanna workout?',
          buttons: [
            { type: 'postback', title: 'Yes', payload: 'exercise' },
            { type: 'postback', title: 'No', payload: 'relax' }
          ]
        }
      }
    )
  end

  def standard_postback_answer
    if postback.payload == 'exercise'
      puts 'Let`s start exercise'
    elsif postback.payload == 'relax'
      puts "Ok, relax"
    end
  end
end