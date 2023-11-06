require_relative "../config/environment"

class Run
    activity = GetAcitivity.new.get_activity
    puts "#{activity[:details]} - #{activity[:type]}"
end