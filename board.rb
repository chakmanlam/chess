require_relative "pieces"

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    set_up_pieces
  end

  def display
    puts "    a  b  c  d  e  f  g  h"
    @grid.each_with_index do |row, i|
      print " #{8 - i} "
      row.each_with_index do |spot, j|
        bg = (i + j).even? ? :light_black : :white
        piece_display = spot.nil? ? "   " : spot.display
        print piece_display.colorize(background: bg)
      end
      puts
    end
  end

  def set_up_pieces
    back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    (0..7).each { |i| Pawn.new(:white, [6, i], self) }
    back_row.each_with_index { |piece, i| piece.new(:white, [7,i], self) }

    (0..7).each { |i| Pawn.new(:black, [1, i], self) }
    back_row.each_with_index { |piece, i| piece.new(:black, [0,i], self) }
  end

  def []=(position, piece) #custom setter method
    row, col = position
    @grid[row][col] = piece
  end

  def [](position) #custome getter method
    row, col = position
    @grid[row][col]
  end

  def on?(end_pos)
    row, col = end_pos

    row.between?(0,7) && col.between?(0,7)
  end

  def move_piece(start_pos, end_pos, current_player)
    piece = self[start_pos]

    raise "empty spot; must pick a piece" if piece.nil?
    raise "enemy piece; must pick own piece" if piece.color != current_player
    raise "piece cannot move like that" unless piece.moves.include?(end_pos)

    self[start_pos] = nil
    self[end_pos] = piece
    piece.position = end_pos
  end

  def checkmate?(color)
    false
  end
end