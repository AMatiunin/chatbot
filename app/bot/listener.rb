require 'facebook/messenger'

include Facebook::Messenger

class Listener
  Facebook::Messenger::Subscriptions.subscribe(
    access_token: ENV['ACCESS_TOKEN'],
    subscribed_fields: %w[feed mention name]
  )

  Bot.on :message do |message|
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

  Bot.on :postback do |postback|
    if postback.payload == 'exercise'
      puts 'Let`s start exercise'
    elsif postback.payload == 'relax'
      puts "Ok, relax"
    end
  end
end