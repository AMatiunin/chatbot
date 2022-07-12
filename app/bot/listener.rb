require 'facebook/messenger'

include Facebook::Messenger

class Listener
  Facebook::Messenger::Subscriptions.subscribe(
    access_token: ENV['ACCESS_TOKEN'],
    subscribed_fields: %w[feed mention name]
  )

  Bot.on :message do |message|
    message.reply(text: 'Hi from bot!')
  end
end