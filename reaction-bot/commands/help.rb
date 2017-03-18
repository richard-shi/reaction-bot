#!/usr/bin/env ruby

module ReactionBot
  module Commands
    # Displays a help message
    class Help < SlackRubyBot::Commands::Base
      command 'help'

      def self.call(client, data, match)
        client.say(channel: data.channel, text: ReactionBot::USAGE)
      end
    end
  end
end
