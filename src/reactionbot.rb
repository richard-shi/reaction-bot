#!/usr/bin/env ruby

require 'slack-ruby-bot'
require 'redis'

SlackRubyBot::Client.logger.level = Logger::WARN

class ReactionBot < SlackRubyBot::Bot
  class_attribute :data_store

  def self.setup_data_store
  end

  def self.add_value
  end

  def self.remove_value
  end

  # Get each trigger-link keyval pair and call block with it
  def self.each_value(&block)
    # TODO:
    # 1. Get all keys from storage and put into array
    # 2. For each key in array, call block with key,value parameters
  end

  help do
    title 'Reaction Bot'
    desc 'This bot reacts to you with an image'

    command 'add' do
      desc 'Usage: @Reactionbot add <trigger> <link>'
      long_desc 'Adds image at <link> to be displayed when <trigger> appears in chat'
    end

    command 'remove' do
      desc 'Usage: @Reactionbot remove <trigger>'
      long_desc 'Removes <trigger> and its corresponding link from reactionbots memory'
    end

    command '<trigger>' do
      desc 'Usage: Normal message with <trigger> in it'
      long_desc 'Displays corresponding message for <trigger>.'
    end
  end

  # Commands
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

  command 'remove' do |client, data, match|
    trigger = match[:expression]
    if !trigger.empty?
      # Debug
      client.say(channel: data.channel, text: "The trigger is #{trigger}")
    else
      client.say(channel: data.channel, text: "Missing parameter, see 'help remove' for usage")
    end
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

ReactionBot.run
