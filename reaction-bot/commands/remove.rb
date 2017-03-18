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
            ReactionBot::Data::Datastore.remove(client.team.name, trigger)
            client.say(channel: data.channel, text: "Successfully removed image for trigger word #{trigger}")
          else
            client.say(channel: data.channel, text: 'Error: Missing <image> or <trigger>')
          end
        else
          client.say(channel: data.channel, text: 'Error: No <trigger> or <image> given')
        end
      end
    end
  end
end
