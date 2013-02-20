require "seed-fu-mongoid/version"
require "seed-fu-mongoid/document_seeder"
require "seed-fu-mongoid/seed_proxy"
require 'mongoid/document'

if defined?(Rails::Railtie)
  require 'seed-fu-mongoid/railtie'
end

# punch the duck out of Mongoid::Document

module Mongoid::Document
  module ClassMethods
    def seed_once(*constraints)
      seeder = SeedFuMongoid::DocumentSeeder.new(self, constraints, block)

      if seeder.new?
        seeder.seed!
      end
    end

    def seed(*constraints, &block)
      SeedFuMongoid::DocumentSeeder.new(self, constraints, block).seed!
    end
  end
end
