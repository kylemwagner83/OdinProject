DEFAULT_HASH = {"1"=>"1", "2"=>"2", "3"=>"3", "4"=>"4", "5"=>"5", "6"=>"6", "7"=>"7", "8"=>"8", "9"=>"9"}

class Gameboard
    attr_accessor :board_hash

    def initialize(board_hash)
        @board_hash = board_hash
    end

    def update_board()
        system("clear") || system("cls")
        puts " #{board_hash["7"]} │ #{board_hash["8"]} │ #{board_hash["9"]}  "
        puts "───┼───┼─── "
        puts " #{board_hash["4"]} │ #{board_hash["5"]} │ #{board_hash["6"]}  "
        puts "───┼───┼─── "
        puts " #{board_hash["1"]} │ #{board_hash["2"]} │ #{board_hash["3"]}  "
    end

    
    def win_check()
        if board_hash["1"] == board_hash["2"] && board_hash["1"] == board_hash["3"]
            return board_hash["1"]
        elsif board_hash["4"] == board_hash["5"] && board_hash["4"] == board_hash["6"]
            return board_hash["4"]            
        elsif board_hash["7"] == board_hash["8"] && board_hash["7"] == board_hash["9"]
            return board_hash["7"]
        elsif board_hash["1"] == board_hash["4"] && board_hash["1"] == board_hash["7"]
            return board_hash["1"]
        elsif board_hash["2"] == board_hash["5"] && board_hash["2"] == board_hash["8"]
            return board_hash["2"]
        elsif board_hash["3"] == board_hash["6"] && board_hash["3"] == board_hash["9"]
            return board_hash["3"]
        elsif board_hash["1"] == board_hash["5"] && board_hash["1"] == board_hash["9"]
            return board_hash["1"]
        elsif board_hash["7"] == board_hash["5"] && board_hash["7"] == board_hash["3"]
            return board_hash["7"]
        else
            return 0
        end
    end


    def tie_check()
        used_spaces = 0
        board_hash.each { |key, value|
            if value == "X" || value == "O"
                used_spaces += 1
            end
        }
        if used_spaces == 9
            return 1
        else
            return 0
        end
    end


    def end_check()
        if win_check() != 0
            return win_check()
        else
            return tie_check()
        end
        
    end

end