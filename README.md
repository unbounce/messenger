# Messenger

Messenger communicates between the different services and is comprised of a listener and a worker.

## Listeners

To create a listener in your application, run `rails g messenger:listener <type>`.
Listeners must implement a `listen` method.

  ```Ruby
  # Example lib/messenger/workers/something_listener.rb
  module Messenger
    module Listeners
      class SomethingListener
        include Messenger::Listeners

        def listen

          while true do
            # Get a message
            message = 'something'

            ensure_valid_worker

            @worker.work(message)
          end

        end

      end
    end
  end
  ```

Another example listener is the [SqsListener](https://github.com/unbounce/messenger-listeners-sqs).

## Workers

To create a listener in your application, run `rails g messenger:worker <type>`. Workers
must implement a `work` method that accepts one parameter.

  ```Ruby
  # Example lib/messenger/workers/sidekiq_worker.rb
  module Messenger
    module Workers
      class SidekiqWorker
        include Messenger::Workers

        def work(message)
          BlueCollarWorker.perform_async(message)
        end

      end
    end
  end
  ```

## Installation

Add this line to your application's Gemfile:

  ```Ruby
  gem 'messenger', git: 'https://github.com/unbounce/messenger'
  ```

And then execute:

  ```
  $ bundle
  ```

### Configuration

You must set which listener and worker the messenger will use. To create a configuration
file in your application, run `rails g messenger:install`. Set the appropriate type to your
listener or worker type, less the `_listener` or `_worker` suffix.

  ```Ruby
  # Example config/initializers/messenger.rb

  Messenger.configure do |config|
    config.listener_type = :sqs
    config.worker_type = :sidekiq
  end
  ```

## Usage

The messenger can be run using `rake messenger:listen` or from the console
using:

  ```Ruby
  messenger = Messenger.new
  messenger.listen
  ```
