#!/usr/bin/env ruby
module ReactionBot
  module Commands
    # Removes keyvalue pair from data store
    class Remove < SlackRubyBot::Commands::Base
      command 'remove'

      def self.call(client, data, match)
        if trigger = match[:expression]
          Respond.remove_from_matches(client.team.name, trigger)
          client.say(channel: data.channel, text: "Successfully removed image for trigger '#{trigger}'")
        else
          client.say(channel: data.channel, text: 'Error: No <trigger> or <image> given')
        end
      end
    end
  end
end
