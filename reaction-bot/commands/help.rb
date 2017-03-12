#!/usr/bin/env ruby

module ReactionBot
  module Commands
    # Displays a help message
    class Help < SlackRubyBot::Commands::Base
      command 'help'

      def self.usage
        "ReactionBot v0.1\n" \
        "COMMANDS:\n" \
        "add :<trigger>: <image> => Tell reaction_bot to display <image> when <trigger> is heard.\n" \
        "NOTE: trigger must be surrounded by commas and have no whitespace in it.\n" \
        "remove <trigger> => Stop listening for <trigger>\n" \
        "get <trigger> => Ask reaction_bot to show image for <trigger>\n" \
        "help => Show this message\n" \
        "<trigger> => Display corresponding image for <trigger>\n"
      end

      # TODO: Use web client exclusively for better messages
      def self.call(client, data, match)
        client.say(channel: data.channel, text: usage)
      end
    end
  end
end
