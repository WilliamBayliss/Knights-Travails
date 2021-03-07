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
    @adjacency_list = create_adjacency_list(chess_board)
    knight_moves([0,1], [1,3])
  end

  def knight_moves start_coord, end_coord
    moves = []
    start_square = get_square_from_list(start_coord[0], start_coord[1])
    p start_square

  end

  def breadth_first_search square
    # Find square in list
      # If destination is in square.knight_moves
      # Add to visited and return
    # Else
      # Create queue
      # Get all unvisited squares from square.knight_moves from list
      # Add all unvisited squares to queue
      # Call function on each item in queue
  end

  def depth_first_search square
    # Find square in list
      # If destination is in square.knight_moves
      # Add to visited and return
    # Else
  end

  def get_square_from_list x, y
    @adjacency_list.each do |square|
      if square.x == x && square.y == y
        return square
      end
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
end
# Object placed into adjacency lists, with data for x and y coordinate
class Square
  attr_accessor :x, :y, :knight_moves
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

  def move new_position
    @square = new_position
  end
end

Board.new
