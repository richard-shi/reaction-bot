#!/usr/bin/env ruby
module ReactionBot
  module Commands
    # Removes keyvalue pair from data store
    class Remove < SlackRubyBot::Commands::Base
      command 'remove'

      def self.call(client, data, match)
        if match[:expression]
          trigger = match[:expression]
          if trigger
            ReactionBot::Data::Datastore.remove(trigger)
          else
            client.say(channel: data.channel, text: 'Error: Missing <link> or <trigger>')
          end
        else
          client.say(channel: data.channel, text: 'Error: No <trigger> or <link>')
        end
      end
    end
  end
end
