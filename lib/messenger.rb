require 'messenger/version'

module Messenger

  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Configuration.new
    yield(config)
  end

  class Configuration
    attr_accessor :listener_type, :worker_type
  end

end
