require 'rails/generators'

class Messenger
  module Generators
    class WorkerGenerator < Rails::Generators::NamedBase
      desc "Creates a worker"

      def self.source_root
        File.expand_path('../templates', __FILE__)
      end

      def create_worker_file
        template 'worker.rb.erb', File.join('lib/messenger/workers', class_path, "#{file_name}_worker.rb")
      end

    end
  end
end
