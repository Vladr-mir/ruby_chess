# frozen_string_literal: false

# Blueprint for chess pieces
class Piece
  attr_reader :position, :total_moves, :notation
  attr_accessor :threats

  def initialize(symbol, notation, position)
    @symbol = symbol
    @notation = notation
    @position = position
    @total_moves = 0
    @threats = 0
  end

  def to_s
    @symbol
  end

  def to_notation
    "#{@notation}#{position_to_notation}"
  end

  private

  def position_to_notation
    columns = %w[a b c d e f g h]
    "#{columns[@position[0]]}#{@position[1] + 1}"
  end

  def moveset
    total_moves.zero? ? [[1, 0], [2, 0]] : [[1, 0]]
  end

  def attackset
    [[1, 1], [1, -1]]
  end
end
