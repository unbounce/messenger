require 'rails'

class Messenger
  class Railtie < Rails::Railtie
    railtie_name :messenger

    rake_tasks do
      load 'tasks/messenger.rake'
    end

  end
end
