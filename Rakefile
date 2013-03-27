require "bundler/gem_tasks"

task :default do
  system 'bundle exec cucumber'
  exit $?.exitstatus if $?.exitstatus != 0
end
