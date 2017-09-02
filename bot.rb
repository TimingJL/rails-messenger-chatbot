require 'facebook/messenger'

# 1
Facebook::Messenger.configure do |config|
  config.access_token = ENV['ACCESS_TOKEN']
  config.verify_token = ENV['VERIFY_TOKEN']
end

include Facebook::Messenger

Bot.on :message do |message|
  Bot.deliver({
    recipient: message.sender,
    message: {
      text: message.text
    }
  }, access_token: ENV["ACCESS_TOKEN"])
end