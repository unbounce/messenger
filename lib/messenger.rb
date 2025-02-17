require 'messenger/version'
require 'messenger/listeners'
require 'messenger/workers'
require 'messenger/railtie'
require 'active_support/inflector'

class Messenger

  attr_accessor :listener, :worker

  class << self
    attr_accessor :config
  end

  def initialize
    self.class.configure {} if self.class.config.nil?

    @listener = listener_for self.class.config.listener_type if self.class.config.listener_type
    @worker = worker_for self.class.config.worker_type if self.class.config.worker_type

    @listener.worker = @worker if @listener and @worker
  end

  def self.configure
    self.config ||= Configuration.new
    yield(config)
  end

  class Configuration
    attr_accessor :listener_type, :worker_type
  end

  def listen(type = nil)
    listener = type.nil? ? @listener : listener_for(type)
    listener.listen
  end

  def work(message, type = nil)
    worker = type.nil? ? @worker : worker_for(type)
    worker.work message
  end

  private

    def listener_for(type)
      classified = type.to_s.camelize

      begin
        klass = Object.const_get('Messenger').const_get('Listeners').const_get("#{classified}")
      rescue NameError
        require "listeners/#{type}"
        klass = Object.const_get('Messenger').const_get('Listeners').const_get("#{classified}")
      end

      klass.new
    end

    def worker_for(type)
      classified = type.to_s.camelize

      begin
        klass = Object.const_get('Messenger').const_get('Workers').const_get("#{classified}")
      rescue NameError
        require "workers/#{type}"
        klass = Object.const_get('Messenger').const_get('Workers').const_get("#{classified}")
      end

      klass.new
    end

end
