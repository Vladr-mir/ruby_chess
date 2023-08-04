# frozen_string_literal: false

# Piece functionality and movility
class Piece
  attr_reader :symbol
  attr_accessor :pos

  def initialize(symbol = "♙", pos = [0, 0], board_size = 8)
    @board_size = board_size
    @symbol = symbol
    @pos = pos
  end

  def to_s
    @symbol
  end

  def valid_move?
    # Find adjacent moves using movement range
    adjacents_moves = []
    movement_range.map do |move|
      # sums movement range and position
      adjacents_moves << [pos, move].transpose.map(&:sum)
    end

    # remove invalid moves
    adjacents_moves.select do |move|
      move =move.select { |direction| direction.between?(0, @board_size - 1) }
      move.length >= 2
    end
  end

  def movement_range
    [
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0]
    ]
  end
end
