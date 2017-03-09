#!/usr/bin/env ruby

require 'redis'

module ReactionBot
  module Data
    # Manages the storing, serialization and retrieval of the trigger-link pairs
    class Datastore
      class_attribute :shared_client

      def self.serialize()
      end

      def self.unserialize()
      end

      def self.add()
        self.shared_client ||= Redis.new

      end

      def self.remove()
        self.shared_client ||= Redis.new
      end

      def self.get()
        self.shared_client ||= Redis.new
      end
    end
  end
end
