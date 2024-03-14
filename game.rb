require_relative "board"

class Game
  attr_reader :board, :current_player

  COL_HASH = ("a".."h").zip(0..7).to_h
  ROW_HASH = (1..8).to_a.map(&:to_s).zip((0..7).to_a.reverse).to_h

  def initialize
    @board = Board.new
    @current_player = :white
  end

  def play
    until board.checkmate?(current_player)
      begin # Code that might raise an exception
        @board.display
        puts "Turn: #{current_player}"
        puts "Pick piece to move"
        start_pos = notation_to_coord(gets.chomp)
        puts "Pick position to move to"
        end_pos = notation_to_coord(gets.chomp)

        board.move_piece(start_pos, end_pos, current_player)

        change_turn!

      rescue StandardError => e # Code to execute if an exception occurs
        puts e.message
        retry # This will restart the begin block
      end
    end
    puts "#{current_player} is checkmated."

    nil
  end

  def change_turn!
    @current_player = current_player == :white ? :black : :white
  end

  def notation_to_coord(notation)
    raise "Invalid Input. Please enter a position on the board." unless notation.match?(/\A[a-h][1-8]\z/)

    [ROW_HASH[notation[1]], COL_HASH[notation[0]]]
  end


end

game = Game.new
game.play