require "racatt/version"

require 'cucumber/rake/task'
require 'rspec/core/rake_task'


module Racatt

  extend Rake::DSL


  def self.set_cucumber_options(options)
    ENV['CUCUMBER_OPTS'] = options
  end

  def self.create_tasks
    current_scope = Rake.application.current_scope.path

    namespace 'cucumber' do
      desc 'Run all of the Cucumber features'
      task :features, [:command_options] do |_t, args|
        set_cucumber_options(args[:command_options]) if args[:command_options]
      end
      Cucumber::Rake::Task.new(:features)
    end

    namespace 'rspec' do
      desc 'Run all of the RSpec specifications'
      RSpec::Core::RakeTask.new(:specs, :command_options) do |t, args|
        t.rspec_opts = args[:command_options] if args[:command_options]
      end
    end

    desc 'Test All The Things!'
    task :test_everything, [:rspec_command_options, :cucumber_command_options] do |_t, args|
      scope_string = current_scope.empty? ? '' : "#{current_scope}:"

      Rake::Task["#{scope_string}rspec:specs"].invoke(args[:rspec_command_options])
      Rake::Task["#{scope_string}cucumber:features"].invoke(args[:cucumber_command_options])
    end

  end

end
