class Board
# TODO
  def initialize
    chess_board =[[0,0], [0,1], [0,2], [0,3], [0,4], [0,5], [0,6], [0,7], 
                  [1,0], [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7], 
                  [2,0], [2,1], [2,2], [2,3], [2,4], [2,5], [2,6], [2,7], 
                  [3,0], [3,1], [3,2], [3,3], [3,4], [3,5], [3,6], [3,7], 
                  [4,0], [4,1], [4,2], [4,3], [4,4], [4,5], [4,6], [4,7], 
                  [5,0], [5,1], [5,2], [5,3], [5,4], [5,5], [5,6], [5,7], 
                  [6,0], [6,1], [6,2], [6,3], [6,4], [6,5], [6,6], [6,7], 
                  [7,0], [7,1], [7,2], [7,3], [7,4], [7,5], [7,6], [7,7], 
                ]
    @matrix = []
    chess_board.each do |start_square|
      adjacent = []
      chess_board.each do |end_square|
        if end_square[0] == (start_square[0] + 2) && end_square[1] == (start_square[1] + 1)
          adjacent.append(end_square)
        elsif end_square[0] == (start_square[0] + 1) && end_square[1] == (start_square[1] + 2)
          adjacent.append(end_square)
        elsif end_square[0] == (start_square[0] - 1) && end_square[1] == (start_square[1] + 2)
          adjacent.append(end_square)
        elsif end_square[0] == (start_square[0] - 2) && end_square[1] == (start_square[1] - 1)
          adjacent.append(end_square)
        elsif end_square[0] == (start_square[0] - 1) && end_square[1] == (start_square[1] - 2)
          adjacent.append(end_square)
        elsif end_square[0] == (start_square[0] + 1) && end_square[1] == (start_square[1] - 2)
          adjacent.append(end_square)
        elsif end_square[0] == (start_square[0] + 2) && end_square[1] == (start_square[1] -1)
          adjacent.append(end_square)
        end
      end
      @matrix.append(adjacent)
    end
  end

  def knight_moves start_coord, end_coord
    knight = Knight.new
end

class Knight
  def initialize
  end
end

Board.new
