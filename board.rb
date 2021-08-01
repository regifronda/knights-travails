class Board
  attr_accessor :board
  
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def render
    puts
    @board.each do |row|
      row.each do |cell|
      cell.nil? ? print("-") : print(cell.to_s)
      end
      puts
    end
    puts
  end

  def add_piece(square, piece)
    @board = Array.new(8) { Array.new(8) }
    @board[square[0]][square[1]] = piece
  end

    # Treat all possible moves the knight could make as children in a tree
    # Have adjacent nodes
    # Build graph, connecting all possible moves
    # Generate all possibilities from current square
      # use two direction arrays for bfs, row and column
      # All next legal moves include row + or - 2 and column + or - 1 as well as
      # row + or - 1 and column + or - 2
      # Remove moves that aren't on the board like -1
  # Use BFS to search for shortest path between starting square and ending square
    # Initialize discovered_nodes_and distance array, which keeps track of the discovered nodes/squares and number of moves from startin square
    # Initialize array that serves as queue 
    # Insert starting_square/node
    # loop while the queue is not empty
      # Take the front node from the queue into variable current
      # Get all possible squares and nodes from current and add into the queue and discovered arrays
      # Don't mark already visited squares or moves that go off the board as discovered nodes 
        #because that will prevent the queue from ever being empty
      # As soon as you discover the ending square, you find the minimum number of moves
        # Return after discovering ending square
end