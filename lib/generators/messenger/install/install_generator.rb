module Messenger
  module Generators
    class InstallGenerator
      desc "Installs Messenger's initializer"

      def copy_initializer
        template 'messenger.rb.erb', 'config/initializer/messenger.rb'
      end

    end
  end
end
