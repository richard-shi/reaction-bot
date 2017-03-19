#!/usr/bin/env ruby

module Commands
  # Tell Reactionbot to say something to a channel
  class Say < SlackRubyBot::Commands::Base
    command 'say'

    def self.get_channel_id(channel_name)
      /<[#@](?<id>[^>\|]+)(?:\|([^>]+))?>/.match(channel_name)[:id]     
    end

    def self.call(client, data, match)
      channel_name, text = match[:expression].split(" ", 2)
      channel_id = get_channel_id(channel_name)
      #channel_id = (client.web_client.channels_info(channel: channel_name)["channel"])["id"]
      client.say(channel: channel_id, text: text)
    end
  end
end
