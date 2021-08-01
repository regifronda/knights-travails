class Knight
  attr_accessor :piece_symbol, :board, :column, :row, :distance, :jump_movements

  # Give attributes like coordinates and adjacent_nodes to help build a tree
  def initialize(piece_symbol, board)
    @piece_symbol = piece_symbol
    @board = board
    @column = column
    @row = row
    @distance = distance
    # Treat all possible moves the knight could make as children in a tree
    # Have adjacent nodes
    # Build graph, connecting all possible moves
    # Generate all possibilities from current square
      # use two direction arrays for bfs, row and column
      # All next legal moves include row + or - 2 and column + or - 1 as well as
      # row + or - 1 and column + or - 2
    @movements = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
  end
  
  # Remove moves that aren't on the board like -1 or 8
  def legal_move?(node)
    node.all? { |movement| movement >= 0 && movement <= 7}
  end

  def build_path(starting_square, ending_square, discovered_nodes)
    path = [starting_square]
    p "entered build_path. path: #{path}"
    while next_node = discovered_nodes[path.last]
      p "discovered_nodes: #{discovered_nodes}"
      p "next_node: #{next_node}"
      path << next_node
    end
    p "path.last: #{path.last} compared with ending_square: #{ending_square}"
    path.last == ending_square ? path : nil
    path.each do |square|
      @board.add_piece(square, @piece_symbol)
      @board.render
    end
  end

  def possible_moves(node)
    p "entered possible moves"
    @movements.map { |column, row| [node.first + column, node.last + row] }.
    select(&method(:legal_move?))
  end

  # Use BFS to search for shortest path between starting square and ending square
  def knight_moves(starting_square, ending_square)
    p "starting_square: #{starting_square}"
    #@board.add_piece(starting_square, @piece_symbol)
    #@board.render
    #@board.add_piece(ending_square, @piece_symbol)
    #@board.render
    # Initialize discovered_nodes and distance array, which keeps track of the discovered nodes/squares and number of moves from startin square
    discovered_nodes = {}
    # Initialize array that serves as queue 
    queue = [[ending_square, nil]]
    # Insert starting_square/node
    # loop while the queue is not empty
    while queue.any?
      # Search from ending_square to starting_square to find the shortest path
      p "queue: #{queue}"
      current_node, next_node = queue.shift
      next if discovered_nodes.has_key?(current_node)
      
      discovered_nodes[current_node] = next_node
      p "current node after next if statement: #{current_node}"
      p "next node after next if statement: #{next_node}"
      p "discovered_nodes after next if statement: #{discovered_nodes}"
      
      return build_path(starting_square, ending_square, discovered_nodes) if current_node == starting_square
      
      possible_moves(current_node).each do |next_move|
        p "entered each enumerable"
        queue << [next_move, current_node] unless discovered_nodes.has_key?(next_move)
      end
    end
  end
end