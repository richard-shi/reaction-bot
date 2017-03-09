module ReactionBot
  module Commands
    class Respond < SlackRubyBot::Commands::Base
      # regex = Regexp.new('A REGEX')

     # match(/^How is the weather in (?<location>\w*)\?$/i) do |client, data, match|
     #   client.say(channel: data.channel, text: "The weather in #{match[:location]} is nice.")
     # end

      
      # Note: the match in scan is an array of MatchData objects
      scan(/([A-Z]{2,5}+)/) do |client, data, match|
        client.say(channel: data.channel, text: "Type of match is #{match.class}")
      end
    end
  end
end
