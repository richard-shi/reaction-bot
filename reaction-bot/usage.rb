#!/usr/bin/env ruby

module ReactionBot
  USAGE = <<-USAGE.freeze
ReactionBot #{ReactionBot::VERSION}
COMMANDS:
add <trigger> <image_url> => Tell ReactionBot to react to a word you say (surrounded by colons)
remove <trigger>\t\t\t\t => Tell ReactionBot to stop listening to a word
get <trigger>\t\t\t\t\t\t=> Ask ReactionBot to show an image for a word
list\t\t\t\t\t\t\t\t\t\t  => Show all the words Reactionbot is listening for
help\t\t\t\t\t\t\t\t\t   => Show this help message
  USAGE
end
