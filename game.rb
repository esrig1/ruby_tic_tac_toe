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
    def modify_board(player_num, row, col)
        @Matrix[row][col] = player_num
    end
    def is_winner?
        @Matrix.each_with_index do |x, index|
            #check if any rows are winners
            if x[1] == x[2] && x[2] == x[3] && x[1] != ""
                return true
            end
            #check if any columns are winners
            if @Matrix[1][index] == @Matrix[2][index] &&  @Matrix[2][index] == @Matrix[3][index] && @Matrix[3][index] != ""
                return true
            end
            #check if any diagonals are winners
            if @Matrix[1][1] == @Matrix[2][2] &&  @Matrix[2][2] == @Matrix[3][3] && @Matrix[3][3] != ""
                return true
            end
            if @Matrix[3][1] == @Matrix[2][2] &&  @Matrix[2][2] == @Matrix[1][3] && @Matrix[2][2] != ""
                return true
            end
        end

end
class Player
    def initialize(player_num, board)
        @player_num = player_num
        @board = board
    end
    def get_input
        puts "Player #{@player_num}, enter which row you would like"
        @row = gets.chomp.to_i
        puts "Player #{@player_num}, enter which column you would like"
        @col = gets.chomp.to_i
        @board.modify_board(@player_num, @row, @col)
    end 
end

test = Board.new
test.print_board
p1 = Player.new(1, test)
p2 = Player.new(2, test)
while true do
    p1.get_input
    test.print_board
    if test.is_winner? == true
        puts "Player 1 Wins"
        break
    end
    p2.get_input
    test.print_board
    if test.is_winner? == true
        puts "Player 2 Wins"
        break
    end
end
end
