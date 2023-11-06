require_relative "../config/environment"

class Run
    BoredAPI.get_activity
    puts "#{activity[:details]} - #{activity[:type]}"
end