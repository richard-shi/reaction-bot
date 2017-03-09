#!/usr/bin/env ruby

module ReactionBot
  class Bot < SlackRubyBot::Bot

    # Get each trigger-link keyval pair and call block with it
    def self.each_value(&block)
      # TODO:
      # 1. Get all keys from storage and put into array
      # 2. For each key in array, call block with key,value parameters
    end

    command 'debug' do |client, data, match|
      client.web_client.chat_postMessage(
        channel: data.channel,
        as_user: true,
        attachments: [
          {
            fallback: 'Debug image',
            title: 'Debug image title',
            text: 'Debug image text',
            image_url: 'https://lh3.googleusercontent.com/-cyPsGjzL-b4/AAAAAAAAAAI/AAAAAAAAH5c/VN9hrjCMxGQ/s640/photo.jpg'
          }
        ]
      )
    end

    #match(/^How is the weather in (?<location>\w*)\?$/i) do |client, data, match|
    #  client.say(channel: data.channel, text: "The weather in #{match[:location]} is nice.")
    #end
  end
end
