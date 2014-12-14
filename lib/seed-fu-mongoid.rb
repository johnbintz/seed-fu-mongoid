require "seed-fu-mongoid/version"
require "seed-fu-mongoid/document_seeder"
require "seed-fu-mongoid/seed_proxy"
require 'mongoid/document'

if defined?(Rails::Railtie)
  require 'seed-fu-mongoid/railtie'
end

# punch the duck out of Mongoid::Document

module SeedFuMongoid
  class << self
    attr_accessor :quiet

    def seed
      files = Dir['db/fixtures/*.rb'].sort
      files += Dir["db/fixtures/#{Rails.env}/*.rb"].sort
      files.each do |file|
        puts "== Seed from #{file}" unless quiet

        load file
      end
    end
  end
end

module Mongoid::Document
  module ClassMethods
    def seed_once(*constraints, &block)
      SeedFuMongoid::DocumentSeeder.new(self, constraints, block).seed_once!
    end

    def seed(*constraints_and_objects, &block)
      SeedFuMongoid::DocumentSeeder.new(self, constraints_and_objects, block).seed!
    end
  end
end
