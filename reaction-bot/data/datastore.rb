#!/usr/bin/env ruby

require 'redis'

module ReactionBot
  module Data
    # Manages the storing and retrieval of the trigger-link pairs
    class Datastore
      class_attribute :shared_client

      def self.client_can_connect?
        shared_client.ping
        return true
      rescue
        puts "Error: Could not connect to database server: #{e}"
        return false
      end

      def self.new_client
        client = Redis.new
        client.ping
        return client
      rescue Errno::ECONNREFUSED => e
        puts "Error: Could not connect to database server: #{e}"
        return nil
      end

      def self.add(team, key, value)
        self.shared_client ||= new_client
        shared_client.hset(team, key, value)
      end

      def self.remove(team, key)
        self.shared_client ||= new_client
        shared_client.hdel(team, key)
      end

      def self.get(team, key)
        self.shared_client ||= new_client
        shared_client.hget(team, key)
      end

      def self.get_all(team)
        self.shared_client ||= new_client
        shared_client.hgetall(team)
      end

      def self.keys(team)
        self.shared_client ||= new_client
        shared_client.hkeys team
      end
    end
  end
end
