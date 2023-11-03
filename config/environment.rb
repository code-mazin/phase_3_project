require 'active_record'
require 'colorize'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "./db"
)