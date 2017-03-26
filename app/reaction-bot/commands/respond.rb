#!/usr/bin/env ruby

require 'pry-remote'

module ReactionBot
  module Commands
    class Respond < SlackRubyBot::Commands::Base
      # Encapsulate to allow for json conversion
      def self.encapsulate_in_json(resource)
        [{ 'text' => '', 'image_url' => resource }]
      end

      def self.new_route(regex)
        scan(regex) do |client, data, matches|
          matches.each do |match|
            url = Data::WordList.get(client.team.name, match)
            next if url.nil?
            client.web_client.chat_postMessage(
              channel: data.channel,
              as_user: true,
              attachments: encapsulate_in_json(url)
            )
          end
        end
      end

      def self.load_matches(team_name)
        new_route(Regexp.union(Data::WordList.words(team_name)))
      end

      def self.add_to_matches(team_name, word, value)
        routes.clear if routes
        Data::WordList.add(team_name, word, value)
        load_matches(team_name)
      end

      def self.remove_from_matches(team_name, word)
        routes.clear if routes
        Data::WordList.remove(team_name, word)
        load_matches(team_name)
      end

      # Overriding parent to load matches
      def self.invoke(client, data)
        load_matches(client.team.name) unless routes
        super(client, data)
      end
    end
  end
end
