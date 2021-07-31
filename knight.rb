class Knight
  attr_accessor :piece_symbol, :board

  # Give attributes like coordinates and adjacent_nodes to help build a tree
  def initialize(piece_symbol, board)
    @piece_symbol = piece_symbol
    @board = board
  end

  def knight_moves(starting_square)
    board.add_piece(starting_square, piece_symbol)
  end

  # Treat all possible moves the knight could make as children in a tree
    # Have adjacent nodes
    # Build graph, connecting all possible moves
    # Generate all possibilities from current square
      # use two direction arrays for bfs, row and column
      # All next legal moves include row + or - 2 and column + or - 1 as well as
      # row + or - 1 and column + or - 2
      # Remove moves that aren't on the board like -1 or 8
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