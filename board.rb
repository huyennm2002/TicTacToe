class Board
    $board = Hash.new
    def initialize
        ('a'..'c').each do |letter|
            (1..3).each do |i|
                $board["#{i}#{letter}"] = " - "
            end
        end
    end
    def print_board
        ('a'..'c').each do |letter|
            (1..3).each do |i|
                print $board["#{i}#{letter}"]
            end
            puts "\n"
        end
        
    end

    def insert_move(loc,player)
        if valid_move(loc)             
            if player == 1
                $board["#{loc}"]= ' X '
            elsif player == 2
                $board["#{loc}"] = ' O '
            end
        end
    end

    def valid_move(loc)
        if $board["#{loc}"] == ' - '
            return true            
        else 
            return false            
        end
    end

    def checkwin
        if check_col == true || check_row == true || check_diagonal == true
            return true
        else 
            return false
        end
    end

    def check_row
        win_row = false
        for i in ('a'..'c') do
            if $board["1#{i}"] != ' - ' && $board["1#{i}"] == $board["2#{i}"] && $board["2#{i}"] == $board["3#{i}"]
                win_row = true
            end
        end
        if win_row
            puts "row"
        end
        return win_row

    end

    def check_col
        win_col = false
        for i in (1...3) do
            if $board["#{i}a"] != ' - ' && $board["#{i}a"] == $board["#{i}b"] && $board["#{i}b"] == $board["#{i}c"]
                win_col = true
            end
        end
        return win_col
    end

    def check_diagonal
        win_dia = false
        if $board["1a"] == $board["2b"] && $board["2b"] == $board["3c"] && $board["2b"] != " - "
            win_dia = true
        elsif $board["3a"] == $board["2b"] && $board["2b"] == $board["1c"] && $board["2b"] != " - "
            win_dia = true
        else 
            win_dia = false
        end
        return win_dia
    end
end

