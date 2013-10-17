namespace :messenger do

  desc 'Listen for messages and process them'
  task :listen => :environment do
    messenger = Messenger.new
    messenger.listen
  end

end
