require_relative "../config/environment"

class Run
    attr_accessor :user
    def initialize
        puts "Welcome to the Bored App!".white.on_green.bold

        puts "To sign-in, Please enter your username :"
        username = gets.chomp


        if User.find_by_name(username)
            @user = User.find_by_name(username)
            puts "Welcome back, #{user.name.capitalize()}!"
        else
            @user = User.create(name: username)
            puts "#{user.name.capitalize()} account successfully created!"
        end

        is_active = true

        while is_active do

            choice = menu

            if choice.downcase == ".exit"
                is_active = false
                puts "Thank you for using Bored App. Goodbye, #{user.name}!".red.bold
            elsif choice.downcase == ".explore"
                system("clear")
                explore
            elsif choice.downcase == ".list"
                system("clear")
                list
            else
                system("clear")
                puts "Command not found!".red.bold
            end
        end
    end

    def menu
        puts "MENU:"
        puts "#{".explore".on_green}\t- to get new activity"
        puts "#{".list".on_green}\t\t- to check saved activities list"
        puts "#{".exit".on_green}\t\t- to terminate the Bored App!"

        puts "Please enter your command:"
        gets.chomp
    end

    def explore
        is_explore = true

            while is_explore do 
                
                puts "Looking for a new activity...".green
                sleep(2)
                puts "Just found a new activity:".green
                
                activity = GetActivity.new.get_activity
                
                puts "#{activity[:details]} - type: #{activity[:type]}"
                
                puts "Add to my list (yes/no)?"
                
            input = gets.chomp

            if input.downcase == "yes"
                user.activities.create(details: activity[:details], type: activity[:type])
                puts "You have added #{activity[:details]} to the list."
            else
                puts "Activity deleted.".on_red
            end

            puts "Continue exploring (yes/no)?"

            cont = gets.chomp

            if cont.downcase != "yes"
                is_explore = false
                system("clear")
            end
        end
    end

    def list
        puts "activities selected by the user".on_green
        user.activities.each_with_index do |activity, i|
            puts "#{i+1}. #{activity.details} - type: #{activity[:type]}"
        end

        puts "\n\nPress enter to go back to the main menu"
        go_back = gets.chomp
        system("clear")
    end
end
        
    # * get activity
    
Run.new
