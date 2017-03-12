#!/usr/bin/env ruby

module ReactionBot
  module Commands
    # Returns all trigger words
    class List < SlackRubyBot::Commands::Base
      command 'list'

      def self.call(client, data, match)
        key_list = ReactionBot::Data::Datastore.keys

        # List all trigger word keys
        client.say(channel: data.channel, text: "Added trigger words:\n")
        key_list.each do |key|
          client.say(channel: data.channel, text: key)
        end
      end
    end
  end
end
