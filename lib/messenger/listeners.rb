class Messenger
  module Listeners

    attr_reader :worker

    def worker=(worker)
      @worker = worker
      ensure_valid_worker
    end

    def listen
      raise NotImplementedError.new('Subclass must implement listen')
    end

    private

      def ensure_valid_worker
        raise NotImplementedError.new('Worker must have work method') unless @worker.respond_to? :work
      end

  end
end
