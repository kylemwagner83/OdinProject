def gameloop()
    game_board = Gameboard.new(DEFAULT_HASH)
    game_board.update_board
    player = 1
    while game_board.end_check() == 0

        if (player == 1)
            playersymbol = "X"
        else
            playersymbol = "O"
        end

        invalid_message = "\n"
        while true
            
            print "#{invalid_message}Player #{player} \"#{playersymbol}\" - Choose your position: "
            
            choice = gets.chomp

            if (game_board.board_hash["#{choice}"] == choice)
                game_board.board_hash["#{choice}"] = playersymbol
                game_board.update_board
                player == 1 ? player = 2 : player = 1
                invalid_message = "\n"
                break
            else
                game_board.update_board
                invalid_message = "\n#{choice} is not valid\n"
            end
        end
    end

    if game_board.end_check == 1
        puts "Tie game!"
    elsif game_board.end_check == "X"
        puts "Player 1 \"X\" wins!"
    else
        puts "Player 2 \"O\" wins!"
    end
    return 1
end