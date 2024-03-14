require_relative "piece"

class Rook < Piece

  def unicode
    "\u265C"
  end

  def moves
    moves = []
    direction.each do |direction|
      (1..7).each do |i|

      end

    moves
  end

  def directions
    [
      [1,0],
      [-1,0],
      [0,1],
      [0,-1],

    ]
  end


end