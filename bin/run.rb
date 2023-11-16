require_relative "../config/environment"

class Run
    attr_accessor :user
    def initialize
        puts "Welcome to the Bored App!"

        puts "To sign-in, Please enter your username :"
        username = gets.chomp


        if User.find_by_name(username)
            @user = User.find_by_name(username)
            puts "Welcome back, #{user.name}!"
        else
            @user = User.create(name: username)
            puts "#{user.name} account successfully created!"
        end

        is_active = true

        while is_active do

            choice = menu

            if choice.downcase == ".exit"
                is_active = false
                puts "Thank you for using Bored App. Goodbye, #{user.name}!"
            elsif choice.downcase == ".explore"
                system("clear")
                explore
            elsif choice.downcase == ".list"
                system("clear")
                list
            else
                system("clear")
                puts "Command not found!"
            end
        end
    end

    def menu
        puts "MENU:"
        puts "#{".explore"}\t- to get new activity"
        puts "#{".list"}\t\t- to check saved activities list"
        puts "#{".exit"}\t\t- to terminate the Bored App!"

        puts "Please enter your command:"
        gets.chomp
    end

    def explore
        is_explore = true

            while is_explore do 
                
                puts "Looking for a new activity..."
                
                puts "Just found a new activity:"
                
                activity = GetActivity.new.get_activity
                
                puts "#{activity[:details]} - type: #{activity[:desc]}"
                
                puts "Add to my list (yes/no)?"
                
            input = gets.chomp

            if input.downcase == "yes"
                user.activities.create(details: activity[:details], info: activity[:desc])
                puts "You have added #{activity[:details]} to the list."
            else
                puts "Activity deleted."
            end

            puts "Continue exploring (yes/no)?"

            cont = gets.chomp

            if cont.downcase != "yes"
                is_explore = false
                system("clear")
            end
        end
    end
end
        
    # * get activity
    
Run.new
