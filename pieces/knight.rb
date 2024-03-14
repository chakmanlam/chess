require_relative "piece"

class Knight < Piece
  include Steppable

  def unicode
    "\u265E"
  end

  def moves
    moves = []
    movements.each do |movement|
      move = [row + movement[0], col + movement[1]]

      moves << move if board.on?(move) && (board[move].nil? || board[move].color != color)
    end

    moves
  end

  def movements
    [
      [-2, -1],
      [-2,1],
      [2,1],
      [2,-1],
      [-1,-2],
      [-1,2],
      [1,-2],
      [1,2],
    ]
  end
end
