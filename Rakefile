require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "has_activity"
    gemspec.summary = "A simple way to grab recent activity or a columns sum on a given model from a table grouped by day, hour, or week with only 1 SQL query and giving the ability to pad the results for days/weeks/hours with no activity."
    gemspec.email = "carl@house-keeping.com"
    gemspec.homepage = "http://github.com/housekeeper/has_activity"
    gemspec.description = "A simple way to grab recent activity or a columns sum on a given model from a table grouped by day, hour, or week with only 1 SQL query and giving the ability to pad the results for days/weeks/hours with no activity."
    gemspec.authors = ["Cary Dunn", "Carl Burton"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end


desc 'Default: run unit tests.'
task :default => :test

desc 'Test the has_activity plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the has_activity plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'HasActivity'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "the-perfect-gem"
    gemspec.summary = "Summarize your gem"
    gemspec.description = "Describe your gem"
    gemspec.email = "josh@technicalpickles.com"
    gemspec.homepage = "http://github.com/technicalpickles/the-perfect-gem"
    gemspec.description = "TODO"
    gemspec.authors = ["Josh Nichols"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

