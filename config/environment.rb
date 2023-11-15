require 'active_record'
require 'colorize'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "./db/user.sqlite"
)

require_relative "../lib/user"
require_relative "../lib/api"