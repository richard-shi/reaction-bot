#!/usr/bin/env ruby
module ReactionBot
  module Commands
    # Adds key values to data store
    class Add < SlackRubyBot::Commands::Base
      command 'add'

      def self.call(client, data, match)
        if match[:expression]
          trigger, link = match[:expression]
          if trigger && link
            
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
