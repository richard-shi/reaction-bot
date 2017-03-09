module ReactionBot
  module Commands
    class Debug < SlackRubyBot::Commands::Base
      command 'debug'

      def self.call(client, data, match)
        client.web_client.chat_postMessage(
          channel: data.channel,
          as_user: true,
          attachments: [
            {
              fallback: 'Debug image',
              title: 'Debug image title',
              text: 'Debug image text',
              image_url: 'https://lh3.googleusercontent.com/-cyPsGjzL-b4/AAAAAAAAAAI/AAAAAAAAH5c/VN9hrjCMxGQ/s640/photo.jpg'
            }
          ]
        )
      end
    end
  end
end
