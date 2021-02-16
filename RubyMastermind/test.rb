RED = "\e[41m     \e[0m"
GREEN = "\e[42m     \e[0m"
YELLOW = "\e[43m     \e[0m"
BLUE = "\e[44m     \e[0m"
MAGENTA = "\e[45m     \e[0m"
CYAN = "\e[46m     \e[0m"

HINT_COLOR = "\e[31m\u220E\e[0m"
HINT_WHITE = "\e[37m\u220E\e[0m"
HINT_BLANK = " "


def hints()
    codelist = [1, 1, 2, 4]
    guesslist = [1, 1, 1, 1]
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


hints()
    

