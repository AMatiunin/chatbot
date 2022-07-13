require 'facebook/messenger'

include Facebook::Messenger

class Listener
  Facebook::Messenger::Subscriptions.subscribe(
    access_token: ENV['ACCESS_TOKEN'],
    subscribed_fields: %w[feed mention name]
  )

  def execute_survey(postback)
    answer = postback.payload

    case answer
    when "EXIT"
      exit_survey(postback)
    when "START"
      start_exercise(postback, 1)
    when "EXERCISE_2"
      start_exercise(postback, 2)
    when "EXERCISE_3"
      start_exercise(postback, 3)
    when "EXERCISE_4"
      start_exercise(postback, 4)
    else
      puts "Somehow you sent an invalid postback value!"
    end
  end

  def start_exercise(postback, number)
    postback.reply(
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button',
          text: "This is the #{number} exercise, when you done it, go for another?",
          buttons: [
            { type: 'postback', title: 'Go next', payload: "EXERCISE_#{number}" },
            { type: 'postback', title: 'No', payload: 'EXIT' }
          ]
        }
      }
    )
  end

  def exit_survey postback
    postback.reply(text: 'Oh, it`s so sad')
  end

  Bot.on :postback do |postback|
    execute_survey(postback)
  end

  Bot.on :message do |message|
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