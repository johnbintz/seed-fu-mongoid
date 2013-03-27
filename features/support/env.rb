require 'database_cleaner'
require 'mongoid'

Mongoid.load!('config/mongoid.yml', :test)

DatabaseCleaner[:mongoid].strategy = :truncation

Before do
  DatabaseCleaner[:mongoid].start
end

After do
  DatabaseCleaner[:mongoid].clean
end

$: << File.expand_path('lib')

require 'seed-fu-mongoid'

class Record
  include Mongoid::Document

  field :data, type: String
end

