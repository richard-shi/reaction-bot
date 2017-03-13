#!/usr/bin/env ruby

module ReactionBot
  module Commands
    # Returns all trigger words
    class List < SlackRubyBot::Commands::Base
      command 'list'

      def self.call(client, data, match)
        key_list = ReactionBot::Data::Datastore.keys

        # List all trigger word keys
        trigger_list = "Trigger word list: \n"
        key_list.each do |key|
          trigger_list += "#{key}\n"
        end

        # Send message
        client.say(channel: data.channel, text: trigger_list)
      end
    end
  end
end
