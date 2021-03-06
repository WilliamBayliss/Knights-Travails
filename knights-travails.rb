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
    @moves = create_adjacency_list(chess_board)

    @moves.each do |adjency_list|
      p adjency_list
    end
  end

  def knight_moves start_coord, end_coord, chess_board
    start_square = Square.new(start_coord)
    end_square = Square.new(end_coord)

    start_index = find_square_index_in_adj_list(chess_board, start_coord)
    
    knight = Knight.new(start_square)

    

  end

  def depth_first_search index, square
    visited = []
    if index.contains square
      visited.append(square)
    end


    
  end

  # Takes Chess board and, for each square, iterates over the board to see if other squares on the board constitute a legal move for a Knight from that square
  # If a Knight can move to the end_square from the start_square, a Square object is created with the x and y coordinates
  # and added to the start_square's adjancy list.
  # the full adjacency list - matrix - is returned at the end
  def create_adjacency_list chess_board
    adjency_list = []
    chess_board.each do |start_square|
      square = Square.new(start_square[0], start_square[1])
      adjacent_squares = []
      chess_board.each do |end_square|
        if end_square[0] == (start_square[0] + 2) && end_square[1] == (start_square[1] + 1)
          adjacent_square = Square.new(end_square[0], end_square[1])
          adjacent_squares.append(adjacent_square)
        elsif end_square[0] == (start_square[0] + 1) && end_square[1] == (start_square[1] + 2)
          adjacent_square = Square.new(end_square[0], end_square[1])
          adjacent_squares.append(adjacent_square)
        elsif end_square[0] == (start_square[0] - 1) && end_square[1] == (start_square[1] + 2)
          adjacent_square = Square.new(end_square[0], end_square[1])
          adjacent_squares.append(adjacent_square)
        elsif end_square[0] == (start_square[0] - 2) && end_square[1] == (start_square[1] - 1)
          adjacent_square = Square.new(end_square[0], end_square[1])
          adjacent_squares.append(adjacent_square)
        elsif end_square[0] == (start_square[0] - 1) && end_square[1] == (start_square[1] - 2)
          adjacent_square = Square.new(end_square[0], end_square[1])
          adjacent_squares.append(adjacent_square)
        elsif end_square[0] == (start_square[0] + 1) && end_square[1] == (start_square[1] - 2)
          adjacent_square = Square.new(end_square[0], end_square[1])
          adjacent_squares.append(adjacent_square)
        elsif end_square[0] == (start_square[0] + 2) && end_square[1] == (start_square[1] -1)
          adjacent_square = Square.new(end_square[0], end_square[1])
          adjacent_squares.append(adjacent_square)
        end
      end
      square.knight_moves = adjacent_squares
      adjency_list.append(square)
    end
    adjency_list
  end

  def find_square_index_in_adj_list chess_board, coordinate
    chess_board.each_with_index do |square, index|
      if square == coordinate
        return index
      end
    end
  end
end

# Object placed into adjacency lists, with data for x and y coordinate
class Square
  attr_accessor :x_coord, :y_coord, :knight_moves
  def initialize x_coord, y_coord
    @x = x_coord
    @y = y_coord
    @knight_moves = nil
  end
end

# Object that takes a Square as its current position, and contains a method to update the Square to a new position
class Knight
    attr_accessor :square
  def initialize square
    @square = square
  end

  def move coordinate
    @square = coordinate
  end
end

Board.new
