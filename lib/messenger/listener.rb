
module Messenger
  class Listener

    def initializer
      @default_listener = listener_for Messenger.config.listener_type
    end

    def self.listen(type = nil)
      self.new.listen type
    end

    def listen(type = nil)
      listener = type.nil? ? @default_listener : listener_for(type)
      listener.listen
    end

    private

      def listener_for(type)
        classified = type.to_s.capitalize
        klass = Object.const_get('Messenger').const_get('Listeners').const_get("#{classified}Listener")
        klass.new
      end

  end
end
