class Messenger
  module Workers
    class NamespacedTest
      include Messenger::Workers

      def work(message)
      end

    end
  end
end
