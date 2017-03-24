#!/usr/bin/env ruby

module ReactionBot
  USAGE = <<-USAGE.freeze
ReactionBot #{ReactionBot::VERSION}
COMMANDS:
*add <trigger> <image_url>* => Tell ReactionBot to react to a word or sentence you say
*remove <trigger>*\t\t\t\t => Tell ReactionBot to stop listening to a trigger
*get <trigger>*\t\t\t\t\t\t=> Ask ReactionBot to show an image for a trigger
*list*\t\t\t\t\t\t\t\t\t\t  => Show all the trigger sentences Reactionbot is listening for
*help*\t\t\t\t\t\t\t\t\t   => Show this help message
  USAGE
end
