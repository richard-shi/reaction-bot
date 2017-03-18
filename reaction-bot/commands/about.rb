#!/usr/bin/env ruby

module ReactionBot
  module Commands
    class Default < SlackRubyBot::Commands::Base
      command 'about'
      match(/^(?<bot>[[:alnum:][:punct:]@<>]*)$/u)

      def self.call(client, data, match)
        client.say(channel: data.channel, text: ReactionBot::ABOUT)
      end
    end
  end
end
