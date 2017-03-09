#!/usr/bin/env ruby
module ReactionBot
  module Commands
    # Adds key values to data store
    class Add < SlackRubyBot::Commands::Base
      command 'add'

      def self.convert_to_json(resource)
        [
          {
            'text' => '',
            'image_url' => resource
          }
        ].to_json
      end

      def self.call(client, data, match)
        if match[:expression]
          trigger, link = match[:expression].split
          puts "(#{trigger}, #{link})"
          if !trigger.nil? && !link.nil?
            ReactionBot::Data::Datastore.add(trigger, convert_to_json(link))
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
