require "./colors.rb"
require "./mode1.rb"
require "./mode2.rb"

system("clear") || system("cls")
puts "\e[31;1;4mMastermind\e[0m"
puts ""
puts ""

def gameselect()

    def play_again()
        print "Enter 'y' to play again, any other key to quit: "
        playagain = gets.chomp
        if playagain == "y"
            return 1
        else
            return 0
        end
    end

    puts "Would you like to:"
    puts "1 - Guess the random secret code"
    puts "2 - Select a code for the computer to guess"
    puts "3 - Quit game"
    game_mode = gets.chomp

    if game_mode == "1"
        start_game_mode1()
        if play_again() == 1
            return 0
        end
        
    elsif game_mode == "2"
        puts "Not yet implemented."
        sleep(2)
        return 0

    elsif game_mode == "3"
        return 1

    else
        return 0
    end    
end

while gameselect() == 0
    system("clear") || system("cls")
    puts "\e[31;1;4mMastermind\e[0m"
    puts ""
    puts "Please select from the options below"
end
