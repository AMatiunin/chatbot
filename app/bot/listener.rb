require 'facebook/messenger'

include Facebook::Messenger

class Listener
  Facebook::Messenger::Subscriptions.subscribe(
    access_token: ENV['ACCESS_TOKEN'],
    subscribed_fields: %w[feed mention name]
  )

  Bot.on :message do |message|
    Bot.deliver({
                  recipient: message.sender,
                  message: {
                    text: 'Uploading your message to skynet.'
                  }
                }, access_token: ENV['ACCESS_TOKEN'])
  end
end