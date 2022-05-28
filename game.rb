
require_relative "board"

class Game
    @player = 0
    def initialize 
        @game_board = Board.new
        @Pturn = false;
        @game_run = true;
        
    end 

    def run 
        @game_board.print_board
        while (@game_run)
            if @Pturn == false
                @player = 1
            else
                @player = 2
            end
            
            choose_location(@game_board)
            if @game_board.checkwin
                @game_run = false

            else
                switch_player()
            end
            
        end
        puts "Player " + @player.to_s + " wins!"
    end

    def choose_location(board)
        location = ''
        print "Please choose your move(a,b,c for row and 1,2,3 for col) (Ex: 1a, 2b, ..): "
        location = gets.chomp
        board.insert_move(location,@player)
        @game_board.print_board
        # switch_player()
    end

    

    def switch_player()
        print "Press (Y/y) to switch player: "
        confirm = gets.chomp
        while confirm != 'y' && confirm != 'Y' do
            print "Invalid Input - Press (Y/y) to switch player: "
            confirm = gets.chomp
        end
        @Pturn = !@Pturn
    end

end

new = Game.new
new.run