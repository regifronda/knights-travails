require_relative 'board'
require_relative 'knight'

class KnightsTravails
  attr_accessor :board, :knight
  
  def initialize
    @board = Board.new
    @board.render
    # set up knight
    @knight = Knight.new("♞", board)
  end
  
  def find_shortest_path(starting_square, ending_square)
    @knight.knight_moves(starting_square, ending_square)
  end
end

knights_travails = KnightsTravails.new
knights_travails.find_shortest_path([3, 3], [0, 0])