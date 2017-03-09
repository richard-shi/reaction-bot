#!/usr/bin/env ruby
require 'redis'

module ReactionBot
  module Commands
    # Adds key values to data store
    class Add < SlackRubyBot::Commands::Base
      command 'add' do |client, data, match|
        params = match[:expression]
        if !params.empty?
          trigger, link = match[:expression].split

          # Debug
          client.say(channel: data.channel, text: "The trigger is #{trigger}, the link is #{link}")
        else
          client.say(channel: data.channel, text: "Missing parameters, see 'help add' for usage")
        end
      end
    end
  end
end
