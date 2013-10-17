require 'messenger/version'
require 'messenger/listeners'
require 'messenger/workers'
require 'messenger/railtie' if defined?(Rails)

class Messenger

  attr_accessor :listener, :worker

  class << self
    attr_accessor :config
  end

  def initialize
    @listener = listener_for self.class.config.listener_type
    @worker = worker_for self.class.config.worker_type

    @listener.worker = @worker
  end

  def self.configure
    self.config ||= Configuration.new
    yield(config)
  end

  class Configuration
    attr_accessor :listener_type, :worker_type
  end

  def self.listen(type = nil)
    self.new.listen type
  end

  def listen(type = nil)
    listener = type.nil? ? @listener : listener_for(type)
    listener.listen
  end

  def self.work(message, type = nil)
    self.new.work message, type
  end

  def work(message, type = nil)
    worker = type.nil? ? @worker : worker_for(type)
    worker.work message
  end

  private

    def listener_for(type)
      classified = type.to_s.capitalize
      klass = Object.const_get('Messenger').const_get('Listeners').const_get("#{classified}Listener")
      klass.new
    end

    def worker_for(type)
      classified = type.to_s.capitalize
      klass = Object.const_get('Messenger').const_get('Workers').const_get("#{classified}Worker")
      klass.new
    end

end
