require_relative 'board'
require_relative 'knight'

class KnightsTravails
  attr_accessor :board, :knight
  def initialize
    @board = Board.new
    board.render
    # set up knight
    @knight = Knight.new
  end
end

knights_travails = KnightsTravails.new