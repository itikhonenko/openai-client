# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'yard'

RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'

RuboCop::RakeTask.new

task default: %i[spec rubocop]

YARD::Rake::YardocTask.new do |t|
  t.files = ['lib/**/*.rb'] # optional
  t.options = ['--any', '--extra', '--opts'] # optional
  t.stats_options = ['--list-undoc']         # optional
end
