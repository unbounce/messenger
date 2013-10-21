require 'rails/generators'

class Messenger
  module Generators
    class WorkerGenerator < Rails::Generators::NamedBase
      desc "Creates a worker"

      def self.source_root
        File.expand_path('../templates', __FILE__)
      end

      def create_worker_file
        template 'worker.rb.erb', File.join('app/messenger/workers', class_path, "#{file_name}.rb")
      end

      def update_application_config
        application 'config.autoload_paths << "#{Rails.root}/app/messenger"'
      end

    end
  end
end
