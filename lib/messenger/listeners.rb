class Messenger
  module Listeners

    attr_accessor :worker

    def listen
      raise NotImplementedError.new('Subclass must implement listen')
    end

    def ensure_valid_worker
      raise unless @worker.respond_to? :work
    end

  end
end
