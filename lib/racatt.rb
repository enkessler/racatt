require "racatt/version"

require 'cucumber/rake/task'
require 'rspec/core/rake_task'


module Racatt

  extend Rake::DSL


  def self.set_cucumber_options(options)
    ENV['CUCUMBER_OPTS'] = options
  end

  def self.combine_options(set_1, set_2)
    set_2 ? "#{set_1} #{set_2}" : set_1
  end

  def self.create_tasks
    current_scope = Rake.application.current_scope.path

    namespace 'cucumber' do
      desc 'Run all of the Cucumber features'
      task :features, [:command_options] do |_t, args|
        set_cucumber_options(combine_options('-t ~@wip -t ~@off', args[:command_options]))
      end
      Cucumber::Rake::Task.new(:features)
    end

    namespace 'rspec' do
      desc 'Run all of the RSpec specifications'
      RSpec::Core::RakeTask.new(:specs, :command_options) do |t, args|
        t.rspec_opts = "-t ~wip -t ~off "
        t.rspec_opts << args[:command_options] if args[:command_options]
      end
    end

    desc 'Test All The Things!'
    task :test_everything, [:command_options] do |_t, args|
      scope_string = current_scope.empty? ? '' : "#{current_scope}:"

      Rake::Task["#{scope_string}rspec:specs"].invoke(args[:command_options])
      Rake::Task["#{scope_string}cucumber:features"].invoke(args[:command_options])
    end

  end

end
