require_relative "piece"

class Pawn < Piece
  def unicode
    "\u265F"
  end

  def moves
    forward_moves + diagonal_attacks
  end

  def forward_moves
    moves = []

    one_step = [row + direction, col]
    two_step = [row + (direction * 2), col]

    moves << one_step if board.on?(move) && board[one_step].nil?
    moves << two_step if board.on?(move) && board[one_step].nil? && board[two_step].nil? && unmoved
    moves
  end

  def diagonal_attacks
    moves = []

    diagonal_left = [row + direction, col - 1]
    diagonal_right = [row + direction, col + 1]

    moves << diagonal_left if !board[diagonal_left].nil? && board[diagonal_left].color != color
    moves << diagonal_right if !board[diagonal_right].nil? && board[diagonal_right].color != color

    moves
  end

  def direction
    color == :black ? 1 : -1
  end

  def unmoved
    color == :white && row == 6 || color == :black && row == 1
  end
end