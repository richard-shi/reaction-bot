#!/usr/bin/env ruby

module ReactionBot
  module Commands
    # Displays a help message
    class Help < SlackRubyBot::Commands::Base
      command 'help' do |client, data, _match|
        client.say(channel: data.channel, text: '4')
      end
    end
  end
end
