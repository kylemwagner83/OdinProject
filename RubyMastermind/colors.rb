RED = "\e[41m     \e[0m"
GREEN = "\e[42m     \e[0m"
YELLOW = "\e[43m     \e[0m"
BLUE = "\e[44m     \e[0m"
MAGENTA = "\e[45m     \e[0m"
CYAN = "\e[46m     \e[0m"

HINT_COLOR = "\e[31m\u25CF\e[0m"
HINT_WHITE = "\e[37m\u25CF\e[0m"
HINT_BLANK = " "

def print_guess(round_num, guess_one, guess_two, guess_three, guess_four, hint_one, hint_two, hint_three, hint_four)
    round_space = " "
    if round_num > 9
        round_space = ""
    end
    puts "Round #{round_num}#{round_space}  #{guess_one} #{guess_two} #{guess_three} #{guess_four}   #{hint_one} #{hint_two}"
    puts "          #{guess_one} #{guess_two} #{guess_three} #{guess_four}   #{hint_three} #{hint_four}"
    puts ""
end


def randomcolor()
    [RED, GREEN, YELLOW, BLUE, MAGENTA, CYAN].sample
end

def print_color_index()
    print"\e[41;1m   Red   \e[0m \e[42;1m  Green  \e[0m \e[43;1m Yellow  \e[0m \e[44;1m  Blue   \e[0m \e[45;1m Magenta \e[0m \e[46;1m  Cyan   \e[0m\n"
    print"\e[41;1m   (r)   \e[0m \e[42;1m   (g)   \e[0m \e[43;1m   (y)   \e[0m \e[44;1m   (b)   \e[0m \e[45;1m   (m)   \e[0m \e[46;1m   (c)   \e[0m"
    puts "\n\n"
end

