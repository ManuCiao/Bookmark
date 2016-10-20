require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

# DataMapper::Logger.new($stdout, :debug)
require_relative 'link'
require_relative 'tag'

DataMapper.finalize
DataMapper.auto_upgrade!
