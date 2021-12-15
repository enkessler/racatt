# Racatt

---

**Attention**: This gem is no longer actively maintained.

---

  Do you use RSPec to test your application? How about Cucumber? Do you, like myself, use both
  and have gotten tired of writing Rake tasks for 'one click' testing for the umpteenth time? Then
  search no more and enjoy some pre-written Rake tasks that do just that! You can even use command
  line arguments for custom test execution!


## Installation

Add this line to your application's Gemfile:

    gem 'racatt'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install racatt

## Usage

  Just require the gem

    require 'racatt'

  and then call its task creation method in your Rakefile (or wherever it is that you
  like to put your Rake tasks) in order to generate Rake tasks that can kick off a
  combined RSpec and Cucumber test suite.

    Racatt.create_tasks

  If you want the tasks to be created in a certain namespace, simply call the creation
  method from within that namespace.

    namespace 'foo' do
      Racatt.create_tasks
    end


## Contributing

1. Fork it ( https://github.com/[my-github-username]/racatt/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
