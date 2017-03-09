#!/usr/bin/env ruby

require 'redis'

module ReactionBot
  module Commands
    # Removes keyvalue pair from data store
    class Remove < SlackRubyBot::Commands::Base
      command 'remove' do |client, data, match|
        trigger = match[:expression]
        if !trigger.empty?
          # Debug
          client.say(channel: data.channel, text: "The trigger is #{trigger}")
        else
          client.say(channel: data.channel, text: "Missing parameter, see 'help remove' for usage")
        end
      end
    end
  end
end
