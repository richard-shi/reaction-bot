#!/usr/bin/env ruby

module ReactionBot
  module Commands
    class Respond < SlackRubyBot::Commands::Base
      def self.encapsulate_in_json(resource)
        [
          {
            'text' => '',
            'image_url' => resource
          }
        ]
      end

      scan(/(?<key>:\S+:)/) do |client, data, matches|
        matches.each do |match|
          url = ReactionBot::Data::Datastore.get(match[0])
          next if url.nil?
          client.web_client.chat_postMessage(
            channel: data.channel,
            as_user: true,
            attachments: encapsulate_in_json(url)
          )
        end
      end
    end
  end
end
