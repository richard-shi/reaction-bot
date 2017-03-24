#!/usr/bin/env ruby

require 'set'
require 'pry-remote'

module ReactionBot
  module Data
    # Word list data model management
    class WordList
      class_attribute :word_list

      def self.load_wordlist(team_name)
        self.word_list ||= Set.new
        self.word_list.merge(Data::Datastore.keys(team_name))
      end

      def self.remove(team_name, word)
        load_wordlist(team_name) unless self.word_list
        Data::Datastore.remove(team_name, word)
        self.word_list.delete?(word)
      end

      def self.add(team_name, word, value)
        load_wordlist(team_name) unless self.word_list
        Data::Datastore.add(team_name, word, value)
        self.word_list.add(word)
      end

      def self.get(team_name, word)
        Data::Datastore.get(team_name, word)
      end

      def self.words(team_name)
        #binding.remote_pry
        load_wordlist(team_name) unless self.word_list
        self.word_list.to_a
      end
    end
  end
end
