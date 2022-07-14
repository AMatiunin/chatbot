require 'facebook/messenger'

include Facebook::Messenger

class Listener

  Facebook::Messenger::Subscriptions.subscribe(
    access_token: ENV['ACCESS_TOKEN'],
    subscribed_fields: %w[feed mention name]
  )

  Bot.on :message do |message|
    message.reply(::WelcomeService.perform(message)) if message.present?
  end

  Bot.on :postback do |postback|
    postback.reply(::AnswerService.perform(postback)) if postback.present?
  end
end