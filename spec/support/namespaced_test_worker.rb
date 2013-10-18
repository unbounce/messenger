class Messenger
  module Workers
    class NamespacedTestWorker
      include Messenger::Workers

      def work
      end

    end
  end
end
