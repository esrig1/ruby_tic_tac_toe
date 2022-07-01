class Board
    def initialize
        @Matrix = Array.new(4) {Array.new(4, "")}
        @Matrix[0][1], @Matrix[1][0] = 1, 1
        @Matrix[0][2], @Matrix[2][0] = 2, 2
        @Matrix[0][3], @Matrix[3][0] = 3, 3
    end
    def print_board
        @Matrix.each do |x|
            p x
            puts
        end
    end

end
#class Player(player_num)
    
#end

test = Board.new
test.print_board