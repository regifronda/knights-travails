class Knight
  attr_accessor :piece_symbol, :board, :movements

  def initialize(piece_symbol, board)
    @piece_symbol = piece_symbol
    @board = board
    @movements = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
  end
  
  def legal_move?(node)
    node.all? { |movement| movement >= 0 && movement <= 7}
  end

  def build_path(starting_square, ending_square, discovered_nodes)
    path = [starting_square]

    while next_node = discovered_nodes[path.last]
      path << next_node
    end

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

  def knight_moves(starting_square, ending_square)
    discovered_nodes = {}
    queue = [[ending_square, nil]]
    while queue.any?
      current_node, next_node = queue.shift
      next if discovered_nodes.has_key?(current_node)
      
      discovered_nodes[current_node] = next_node
      
      return build_path(starting_square, ending_square, discovered_nodes) if current_node == starting_square
      
      possible_moves(current_node).each do |next_move|
        queue << [next_move, current_node] unless discovered_nodes.has_key?(next_move)
      end
    end
  end
end