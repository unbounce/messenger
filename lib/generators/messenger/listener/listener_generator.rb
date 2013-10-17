require 'rails/generators'

class Messenger
  module Generators
    class ListenerGenerator < Rails::Generators::NamedBase
      desc "Creates a listener"

      def self.source_root
        File.expand_path('../templates', __FILE__)
      end

      def create_listener_file
        template 'listener.rb.erb', File.join('lib/messenger/listeners', class_path, "#{file_name}_listener.rb")
      end

    end
  end
end
