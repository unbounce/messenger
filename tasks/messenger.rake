namespace :messenger do

  desc 'Listen for messages and process them'
  task :listen => :environment do
    Messenger::Listener.listen
  end

end
