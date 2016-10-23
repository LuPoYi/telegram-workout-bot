require 'rubygems'
require 'telegram/bot'
require 'yaml'
require 'active_record'
require_relative 'lib/bot.rb'

ActiveRecord::Base.establish_connection( YAML::load(File.open('config/database.yml')))
ActiveRecord::Base.default_timezone = :utc

begin
  ActiveRecord::Base.connection.execute('SELECT "TEST_SERVER_TRANS"')
rescue Exception => e ; puts "==:#{e.message}\n#{e.backtrace.join("\n")}"
  abort('check ActiveRecord connection fail!!')
end

# Bot.start!

