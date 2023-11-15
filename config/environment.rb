require 'active_record'
require 'colorize'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "./db/user.db"
)

ENV["RACK_ENV"] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV["RACK_ENV"])

require_relative "../lib/user"
require_relative "../lib/api"