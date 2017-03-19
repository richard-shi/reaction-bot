#!/usr/bin/env ruby

require 'pry-remote' # For live debugging

module ReactionBot
  module Commands
    class Debug < SlackRubyBot::Commands::Base
      command 'debug'

      def self.call(client, data, match)
        keyword = match[:expression]
        if keyword == ENV['DEBUG_PASSWORD']
          # Start pry-remote debug console
          binding.remote_pry
        end
      end
    end
  end
end
