class Board
  attr_accessor :board
  
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def render
    puts
    board.each do |row|
      row.each do |cell|
      cell.nil? ? print("-") : print(cell.to_s)
      end
      puts
    end
    puts
  end

  def add_piece(starting_square, piece)
    board[starting_square[0]][starting_square[1]] = piece
  end
end