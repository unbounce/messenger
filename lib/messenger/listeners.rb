class Messenger
  module Listeners

    def listen
      raise NotImplementedError.new('Subclass must implement listen')
    end

  end
end
