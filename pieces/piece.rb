class Piece
  attr_reader :color, :board
  attr_accessor :position

  def initialize(color, position, board)
    @color = color
    @position = position
    @board = board

    board[position] = self
  end

  def display
    return " #{unicode} ".colorize(color: colorize_color)
  end

  def colorize_color
    color == :white ? :light_white : :black
  end

  def row
    position[0]
  end

  def col
    position[1]
  end
end