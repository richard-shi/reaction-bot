#!/usr/bin/env ruby

module ReactionBot
  module Commands
    # Displays a help message
    class Help < SlackRubyBot::Commands::Base
      command 'help'


      # TODO: Use web client exclusively for better messages
      def self.call(client, data, match)
        client.say(channel: data.channel, text: ReactionBot::USAGE)
      end
    end
  end
end
