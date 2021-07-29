require_relative 'board'
require_relative 'knight'

class KnightsTravails
  attr_accessor :board
  def initialize
    @board = Board.new
    board.render
    # set up knight
  end
end

knights_travails = KnightsTravails.new