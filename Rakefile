require 'data_mapper'
require './app/app.rb'

namespace :db do
 desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto upgrade"
  end
desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto migrate"
  end

end
