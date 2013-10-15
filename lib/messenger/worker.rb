
module Messenger
  class Worker

    def initalizer
      @default_worker = worker_for Messenger.config.worker_type
    end

    def self.work(message, type = nil)
      self.new.work message, type
    end

    def work(message, type = nil)
      worker = type.nil? ? @default_worker : worker_for(type)
      worker.work message
    end

    private

      def worker_for(type)
        classified = type.to_s.capitalize
        klass = Object.const_get('Messenger').const_get('Workers').const_get("#{classified}Worker")
        klass.new
      end

  end
end
