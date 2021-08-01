class Knight
  attr_accessor :piece_symbol, :board, :column, :row, :distance

  # Give attributes like coordinates and adjacent_nodes to help build a tree
  def initialize(piece_symbol, board)
    @piece_symbol = piece_symbol
    @board = board
    @column = column
    @row = row
    @distance = distance
  end

  def knight_moves(starting_square, ending_square)
    @board.add_piece(starting_square, piece_symbol)
    @board.render
    @board.add_piece(ending_square, piece_symbol)
    @board.render
  end
end