#!/usr/bin/env ruby

require 'redis'

module ReactionBot
  module Data
    # Manages the storing and retrieval of the trigger-link pairs
    class Datastore
      class_attribute :shared_client

      DATA_STORE = ENV['DATA_STORE_ID']

      def self.can_connect?
        test_client = Redis.new
        test_client.ping
        return true
      rescue Errno::ECONNREFUSED => e
        puts "Error: Could not connect to database server: #{e}"
        return false
      end

      def self.add(key, value)
        self.shared_client ||= Redis.new
        shared_client.hset(DATA_STORE, key, value)
      end

      def self.remove(key)
        self.shared_client ||= Redis.new
        shared_client.hdel(DATA_STORE, key)
      end

      def self.get(key)
        self.shared_client ||= Redis.new
        shared_client.hget(DATA_STORE, key)
      end

      def self.get_all
        self.shared_client ||= Redis.new
        shared_client.hgetall(DATA_STORE)
      end

      def self.keys
        self.shared_client ||= Redis.new
        shared_client.hkeys DATA_STORE
      end
    end
  end
end
