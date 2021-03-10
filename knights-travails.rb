class KnightsTravails
  def initialize
    board = Board.new
  end


end

# Creates a Graph structure for squares on a chess board
class Board
# TODO
  def initialize
    @board = {}

    create_graph(get_chess_board_array)
    add_edges_to_graph()
    @board.each do |key, value|
      if value.knight_moves.length > 0
        puts value.knight_moves.length
      end
    end
  end

  def add_square(square)
    @board[square.coordinate] = square
  end

  def add_edge(predecessor_coordinate, successor_coordinate)
    @board[predecessor_coordinate].add_edge(@board[successor_coordinate])
  end

  def [](coordinate)
    @board[coordinate]
  end

  def find_path
    
  end


  def create_graph chess_board
    chess_board.each do |coordinate|
      square = Square.new(coordinate)
      add_square(square)
    end
  end

  def add_edges_to_graph
    @board.each do |square_one, value|
      @board.each do |square_two, value_two|
        if legal_move_validator(square_one, square_two)
          add_edge(square_one, square_two)
        end
      end
    end
  end

  def legal_move_validator square_one, square_two
    if    square_one[0] == (square_two[0] + 2) && square_one[1] == (square_two[1] + 1)  
      return true
    elsif square_one[0] == (square_two[0] + 1) && square_one[1] == (square_two[1] + 2)
      return true
    elsif square_one[0] == (square_two[0] - 1) && square_one[1] == (square_two[1] + 2)
      return true
    elsif square_one[0] == (square_two[0] - 2) && square_one[1] == (square_two[1] - 1)
      return true
    elsif square_one[0] == (square_two[0] - 1) && square_one[1] == (square_two[1] - 2)
      return true
    elsif square_one[0] == (square_two[0] + 1) && square_one[1] == (square_two[1] - 2)
      return true
    elsif square_one[0] == (square_two[0] + 2) && square_one[1] == (square_two[1] -1)
      return true
    else
      return false
    end
  end


  def get_chess_board_array
    chess_board =[[0,0], [0,1], [0,2], [0,3], [0,4], [0,5], [0,6], [0,7], 
                  [1,0], [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7], 
                  [2,0], [2,1], [2,2], [2,3], [2,4], [2,5], [2,6], [2,7], 
                  [3,0], [3,1], [3,2], [3,3], [3,4], [3,5], [3,6], [3,7], 
                  [4,0], [4,1], [4,2], [4,3], [4,4], [4,5], [4,6], [4,7], 
                  [5,0], [5,1], [5,2], [5,3], [5,4], [5,5], [5,6], [5,7], 
                  [6,0], [6,1], [6,2], [6,3], [6,4], [6,5], [6,6], [6,7], 
                  [7,0], [7,1], [7,2], [7,3], [7,4], [7,5], [7,6], [7,7], 
                ] 
    return chess_board
  end

end

# Object placed into adjacency lists, with data for x and y coordinate
class Square
  attr_reader :coordinate, :knight_moves
  def initialize coordinate
    @coordinate = coordinate
    @knight_moves = []
  end

  def add_edge(neighbour)
    @knight_moves << neighbour
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

KnightsTravails.new