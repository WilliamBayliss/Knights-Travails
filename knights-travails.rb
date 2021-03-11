class KnightsTravails
  def initialize
    puts "Welcome to Knights Travails! This program will tell you the shortest path for a Knight from one square on a chess board to any other square on the board."
    puts "You will be prompted for a coordinate in the form [X,Y], please use digits from 0-7 to represent the row/column of the square"
    puts "Example, the first square on the board would be [0,0], and the last square would be [7,7]"
    board = Board.new
  end
end

# Creates a Graph structure for squares on a chess board
class Board
# TODO
  def initialize
    @board = {}

    # Creates Graph and adds edges to squares if a Knight can move from one
    # to another
    create_graph(get_chess_board_array)
    add_edges_to_graph()

    knight_moves()

    
  end

  def add_square(square)
    @board[square.coordinate] = square
  end

  def add_edge(predecessor, successor)
    @board[predecessor].add_edge(@board[successor])
  end

  def [](coordinate)
    @board[coordinate]
  end

  def knight_moves
    # Prompts user to provide coordinates for start and end position,
    # Sanitizes those inputs and returns 2 item array of corresponding squares from the board
    start_and_finish = get_squares()
    # Runs BFS algorithm on graph to create path from start square to all other squares
    # possible_paths is array of hashes where index corresponds to Square index, with attributes of distance and predecessor
    pathway = find_path(start_and_finish[0])


    knight = Knight.new
    current_point = pathway[start_and_finish[1].index]
    knight.move(start_and_finish[1])

    # Moves knight backwards through path until source Square is found
    until current_point[:predecessor].nil?
      knight.move(current_point[:predecessor])
      current_point = pathway[current_point[:predecessor].index]
    end
    # Reverses knight path to present to user
    knight.path.reverse!

    puts "Your Knight took #{knight.path.length - 1} moves! Here's Your path:"
    knight.path.each do |step|
      puts "Knight to #{step.coordinate}"
    end
  end

  def find_path source
    square_info = []

    # Creates an Array of Hashes, square_info, where the index in the array
    # corresponds to the index of a Square on the board,
    # giving each hash at the index properties distance and predecessor
    @board.each_with_index do |(key, value), index|
      square_info[index] = {
        distance: nil,
        predecessor: nil
      }
    end

    # Set source distance to 0 to mark as visited
    square_info[source.index][:distance] = 0

    # Create queue and add source Square
    queue = []
    queue.append(source)

    while queue.length() > 0
      # Dequeue Square
      temp = queue[0]
      queue.shift

      # For each neighbour vertex of Square that has not been visited
      temp.knight_moves.each do |neighbour|
        if square_info[neighbour.index][:distance].nil?
          # Set distance to Square.distance + 1 and set predecessor to Square
          square_info[neighbour.index][:distance] = square_info[temp.index][:distance] + 1
          square_info[neighbour.index][:predecessor] = temp
          # Enqueue Square's neighbouring vertices
          queue.append(neighbour)
        end
      end
    end
    # Return 
    square_info
  end


  def create_graph chess_board
    chess_board.each_with_index do |coordinate, index|
      square = Square.new(coordinate, index)
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

  def get_squares
    puts "Where would you like your Knight to begin?"
    start_coordinate = get_coord_from_user()
    until (start_coordinate[0] >= 0 && start_coordinate[0] < 8) && 
          (start_coordinate[1] >= 0 && start_coordinate[1] < 8)
      puts "Invalid input"
      start_coordinate = get_coord_from_user  
    end

    start_square = @board[start_coordinate]
    puts "Where would you like them to go?"
    
    end_coordinate = get_coord_from_user()
    until (end_coordinate[0] >= 0 && end_coordinate[0] < 8) && 
          (end_coordinate[1] >= 0 && end_coordinate[1] < 8)
      puts "Invalid input"
      end_coordinate = get_coord_from_user  
    end
    end_square = @board[end_coordinate]
    
    array = [start_square, end_square]
    array
  end
  
  def get_coord_from_user
    puts "Please enter a coordinate in the form X,Y"
    input = gets.chomp
    coordinate = sanitize_input(input)
    coordinate
  end

  # Will remove any char that isn't a digit from user input, and ensure the
  # coordinate only takes the first 2 digits if the user enters more than 2
  def sanitize_input input
    input = input.split("")
    array = []
    input.each do |char|
      if char =~ /\d/
        array.append(char.to_i)
      end
    end
    return array[0..1]
  end

end

# Object placed into adjacency lists, with data for x and y coordinate
class Square
  attr_reader :coordinate, :index, :knight_moves
  def initialize coordinate, index
    @coordinate = coordinate
    @index = index
    @knight_moves = []
  end

  def add_edge(neighbour)
    @knight_moves << neighbour
  end
end

# Object that takes a Square as its current position, and contains a method to add squares to the Knight's path
class Knight
    attr_accessor :path
  def initialize
    @path = []
  end

  def move new_position
    @path << new_position
  end
end

KnightsTravails.new