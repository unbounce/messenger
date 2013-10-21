require 'rails/generators'

class Messenger
  module Generators
    class ListenerGenerator < Rails::Generators::NamedBase
      desc "Creates a listener"

      def self.source_root
        File.expand_path('../templates', __FILE__)
      end

      def create_listener_file
        template 'listener.rb.erb', File.join('app/messenger/listeners', class_path, "#{file_name}.rb")
      end

      def update_application_config
        application 'config.autoload_paths << "#{Rails.root}/app/messenger"'
      end

    end
  end
end
