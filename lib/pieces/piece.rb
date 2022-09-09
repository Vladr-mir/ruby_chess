# frozen_string_literal: false

# Blueprint for chess pieces
class Piece
  attr_reader :position, :total_moves, :notation
  attr_accessor :threats

  def initialize(symbol, notation, position, extend_moveset: false, extend_attackset: false)
    @symbol = symbol
    @notation = notation
    @position = position
    @board_size = 8
    @extend_moveset = extend_moveset
    @extend_attackset = extend_attackset
    @total_moves = 0
    @threats = 0
  end

  def to_s
    @symbol
  end

  def to_notation
    "#{@notation}#{position_to_notation}"
  end

  def valid_move?(new_pos)
    valid = find_relative_moves(position)
    valid.each { |move| return true if move == new_pos }
    false
  end

  private

  def find_relative_moves(position)
    relative_moves = moveset
    relative_moves.map do |move|
      move[0] += position[0]
      move[1] += position[1]
    end

    relative_moves.select do |move|
      move = move.select { |pos| pos.between?(0, @board_size) }
      move.length >= 2
    end
  end

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
