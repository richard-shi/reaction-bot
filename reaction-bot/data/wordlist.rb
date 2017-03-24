#!/usr/bin/env ruby

require 'set'

module ReactionBot
  module Data
    # Word list data model management
    class WordList
      def self.load_wordlist(team_name)
        word_list ||= Set.new
        word_list.merge(Data::Datastore.hkeys(team_name))
      end

      def self.remove(team_name, word)
        load_wordlist unless word_list
        Data::Datastore.remove(team_name, word)
        word_list.delete?(word)
      end

      def self.add(team_name, word, value)
        load_wordlist unless word_list
        Data::Datastore.add(team_name, word, value)
        word_list.add(word)
      end

      def self.get(team_name, word)
        Data::Datastore.get(team_name, word)
      end

      def self.words
        load_wordlist unless word_list
        word_list.to_a
      end
    end
  end
end
