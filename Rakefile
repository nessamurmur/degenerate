require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'generative/rake_task'

task(:default).enhance [:spec, :generative]

RSpec::Core::RakeTask.new
Generative::RakeTask.new

task :default => :spec

