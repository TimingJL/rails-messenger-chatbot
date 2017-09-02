require 'facebook/messenger'
require "time"

# 1
Facebook::Messenger.configure do |config|
  config.access_token = ENV['ACCESS_TOKEN']
  config.verify_token = ENV['VERIFY_TOKEN']
end

include Facebook::Messenger

# 2
Bot.on :message do |message|
  puts "Received #{message.text} from #{message.sender}"
  t = Time.new
  Bot.deliver(
    recipient: message.sender,
    # recipient: { id => 10208116277459762 },
    message: {
      text: message.text + '～哈哈' + t.to_s + 'by' + message.sender
    }
  )
  
  # Bot.deliver(
  #   recipient: message.sender,
  #   message: {
  #     attachment: {
  #       type: 'template',
  #       payload: {
  #         template_type: 'button',
  #         text: 'What service would you like to log in with?',
  #         buttons: [
  #           { type: 'postback', title: 'French', payload: 'FRENCH' },
  #           { type: 'postback', title: 'Italian', payload: 'ITALIAN' }
  #         ]
  #       }
  #     }
  #   }
  # )
end

# 3
# Bot.on :postback  do |postback|

#   case postback.payload
#   when 'FRENCH'
#     text = "Bonjour le monde 🇫🇷"
#   when 'INTALIAN'
#     text = "Ciao mondo 🇮🇹"
#   end

#   Bot.deliver(
#     recipient: postback.sender,
#     message: {
#       text: text
#     }
#   )
# end