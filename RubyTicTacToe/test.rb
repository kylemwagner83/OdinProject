


def tie_check()
    board_hash = {"1"=>"X", "2"=>"O", "3"=>"X", "4"=>"4", "5"=>"5", "6"=>"6", "7"=>"7", "8"=>"8", "9"=>"9"}
    used_spaces = 0
    board_hash.each { |key, value|
        if value == "X" || value == "Y"
            used_spaces += 1
        end
    }
    if used_spaces == 9
        return "Win"
    else
        return "not"
    end


end





print tie_check()