#!/usr/bin/env ruby

module ReactionBot
  module Commands
    # Returns reaction image for given word
    class Get < SlackRubyBot::Commands::Base
      command 'get'

      def self.encapsulate_in_json(resource)
        [
          {
            'text' => '',
            'image_url' => resource
          }
        ]
      end

      def self.call(client, data, match)
        if match[:expression]
          keyword = match[:expression]
          url = ReactionBot::Data::Datastore.get(keyword)
          client.web_client.chat_postMessage(
            channel: data.channel,
            as_user: true,
            attachments: encapsulate_in_json(url)
          )
        else
          client.say(channel: data.channel, text: 'Error: No <trigger>')
        end
      end
    end
  end
end
