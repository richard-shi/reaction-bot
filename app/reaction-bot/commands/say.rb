#!/usr/bin/env ruby

#require 'pry-remote'

module Commands
  # Tell Reactionbot to say something to a channel
  class Say < SlackRubyBot::Commands::Base
    command 'say'

    def self.extract_id(escaped_text)
      /<[#@](?<id>[^>\|]+)(?:\|([^>]+))?>/.match(escaped_text)[:id]
    end

    def self.call(client, data, match)
      #binding.remote_pry
      channel_name, text = match[:expression].split(' ', 2)
      channel_id = extract_id(channel_name)

      channel_id = (client.web_client.im_open(user: channel_id)['channel'])['id'] if channel_id[0] == 'U'
      client.say(channel: channel_id, text: text)
    end
  end
end
