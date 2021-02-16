class Mode1

    def initialize()
        @code_one = randomcolor()
        @code_two = randomcolor()
        @code_three = randomcolor()
        @code_four = randomcolor()
        @guess_one = RED
        @guess_two = RED
        @guess_three = RED
        @guess_four = RED
        @hint_one = HINT_BLANK
        @hint_two = HINT_BLANK
        @hint_three = HINT_BLANK
        @hint_four = HINT_BLANK
        @round_num = 0
    end

    def check_round()
        return @round_num
    end


    def print_round()
        print_guess(@round_num, @guess_one, @guess_two, @guess_three, @guess_four, @hint_one, @hint_two, @hint_three, @hint_four)
    end


    def guess()
        def get_guess()
            print "Make your guess (ie 'rgyb'): "
            guess = gets.chomp
            if guess.length() != 4
                return 0
            end
            for x in guess.split("")
                if "rgybmc".include? x
                else
                    return 0
                end
            end
            guesslist = []
            for x in guess.split("")
                if x == "r"
                    guesslist.append(RED)
                elsif x == "g"
                    guesslist.append(GREEN)
                elsif x == "y"
                    guesslist.append(YELLOW)
                elsif x == "b"
                    guesslist.append(BLUE)
                elsif x == "m"
                    guesslist.append(MAGENTA)
                else
                    guesslist.append(CYAN)
                end
            end
            @guess_one = guesslist[0]
            @guess_two = guesslist[1]
            @guess_three = guesslist[2]
            @guess_four = guesslist[3]
            @round_num += 1
        end
        while get_guess() == 0
            puts "invalid"
        end
    end


    def winround()
        if (@hint_one == HINT_COLOR && @hint_two == HINT_COLOR && @hint_three == HINT_COLOR && @hint_four == HINT_COLOR)
            return 1
        else
            return 0
        end
    end
    
    
    def print_code()
        print "#{@code_one} #{@code_two} #{@code_three} #{@code_four}\n"
        print "#{@code_one} #{@code_two} #{@code_three} #{@code_four}"
    end
    
    
    def hints()
        codelist = [@code_one, @code_two, @code_three, @code_four]
        guesslist = [@guess_one, @guess_two, @guess_three, @guess_four]
        hintlist = []
        deleteindex = []
        i=0
        while i < codelist.length()
            if guesslist[i] == codelist[i]
                hintlist.append(HINT_COLOR)
                deleteindex.unshift(i)
            end
            i += 1
        end
        for x in deleteindex
            codelist.delete_at(x)
            guesslist.delete_at(x)
        end
        i=0
        while i < guesslist.length()
            if codelist.include? guesslist[i]
                hintlist.append(HINT_WHITE)
                codelist.delete_at(codelist.index(guesslist[i]))
            end
            i += 1
        end
        while hintlist.length() < 4
            hintlist.append(HINT_BLANK)
        end
        @hint_one = hintlist[0]
        @hint_two = hintlist[1]
        @hint_three = hintlist[2]
        @hint_four = hintlist[3]
    end
    

end


def random_code_animation()
    system("clear") || system("cls")
    print "Generating random code"
    i = 0
    while i < 5
        sleep(1)
        print "."
        i += 1
    end
    system("clear") || system("cls")
    puts "Code has been randomly selected and stored."
    sleep(2)
end

def start_game_mode1()
    game = Mode1.new()
    game_won = false
    random_code_animation()
    print_color_index()

    while (game.check_round < 12)
        game.guess
        game.hints
        game.print_round
        if (game.winround == 1)
            game_won = true
            break
        end
    end
    if (game_won == true)
        puts "Congratulations, you cracked the code!"
        sleep(3)
    else
        puts "Sorry you ran out of time"
        sleep(3)
    end
end