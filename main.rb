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
  
  def test_placement
    @knight.knight_moves([0, 1], [2, 0])
  end
end

knights_travails = KnightsTravails.new
knights_travails.test_placement