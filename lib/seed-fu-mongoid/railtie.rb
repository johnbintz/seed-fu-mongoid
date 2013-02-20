module SeedFuMongoid
  class Railtie < ::Rails::Railtie
    rake_tasks do
      namespace :db do
        desc "Load seed data from db/fixtures"
        task :seed_fu => :environment do
          Dir['db/fixtures/**/*.rb'].each do |file|
            puts "== Seed from #{file}"

            load file
          end
        end
      end
    end
  end
end

