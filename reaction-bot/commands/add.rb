#!/usr/bin/env ruby
module ReactionBot
  module Commands
    # Adds key values to data store
    class Add < SlackRubyBot::Commands::Base
      command 'add'

      # Extracts full URL string from Slacks formatted URL
      def self.extract_url(text_url)
        # text_url.gsub!(/\\u([a-f0-9]{4,5})/i){ [$1.hex].pack('U') }
        /<(?<url>[^>\|]+)(?:\|([^>]+))?>/.match(text_url)[:url]
      end

      def self.call(client, data, match)
        if match[:expression]
          trigger, link = match[:expression].split # use regex to match?
          if !trigger.nil? && !link.nil?
            ReactionBot::Data::Datastore.add(trigger, extract_url(link))
            client.say(channel: data.channel, text: "Successfully added URL for trigger word #{trigger}")
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
