module SeedFuMongoid
  class Railtie < ::Rails::Railtie
    rake_tasks do
      namespace :db do
        desc "Load seed data from db/fixtures"
        task :seed_fu => :environment do
          SeedFuMongoid.seed
        end
      end
    end
  end
end

