require 'rubygems'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ["-c", "-f documentation", "-r ./acceptance/acceptance_helper.rb"]
  task.pattern    = 'acceptance/*_feature.rb'
end

task :default => :spec