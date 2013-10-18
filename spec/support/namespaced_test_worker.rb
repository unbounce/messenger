class Messenger
  module Workers
    class NamespacedTestWorker
      include Messenger::Workers

      def work(message)
      end

    end
  end
end
