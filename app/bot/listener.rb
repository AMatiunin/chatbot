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
      postback.reply(
        attachment: {
          type: 'template',
          payload: {
            template_type: 'button',
            text: 'Ok, let`s go!',
            buttons: [
              { type: 'postback', title: 'Start 1st', payload: 'exercise1' },
              { type: 'postback', title: 'Start 2nd', payload: 'exercise2' }
            ]
          }
        }
      )
    elsif postback.payload == 'relax'
      postback.reply(
        attachment: {
          type: 'image',
          payload: {
            text: 'It`s so sad(',
            url: 'http://s2.quickmeme.com/img/ee/ee71aaef710f28451bb40f142ce53d35ce50405caafdfdb53e73417fc2619af3.jpg'
          }
        }
      )
    end
  end
end