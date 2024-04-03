# frozen_string_literal: false

require_relative "modules/arr_helper"

# Piece functionality and movility
class Piece
  include ArrHelper

  attr_reader :symbol
  attr_accessor :pos

  BOARD_SIZE = 8

  def initialize(pos, symbol = "♙")
    @symbol = symbol
    @pos = pos
    @is_moveset_extended = false
  end

  def to_s
    @symbol
  end

  def valid_direction?(move)
    return false if out_of_bound?(move)

    if @is_moveset_extended
      valid_move_extended?(move)
    else
      !get_direction(move).empty?
    end
  end

  def moveset
    [
      [1, 0],
      [0, 1],
      [-1, 0],
      [0, -1]
    ]
  end

  private

  def valid_move_extended?(move)
    range_move = @pos.clone
    direction = find_relative_move(move)
    direction = direction.map { |axis| axis <=> 0 }
    return false unless moveset.any?(direction)

    range_move = sum_arr(range_move, direction) until range_move == move || out_of_bound?(range_move)
    range_move == move
  end

  def get_direction(move)
    relative_move = find_relative_move(move)
    moveset.select { |direction| direction == relative_move }.flatten
  end

  def find_relative_move(move)
    # move.zip(@pos).map { |pos| pos.inject(:-) }
    substract_arr(move, @pos)
  end

  def out_of_bound?(pos)
    pos.count { |axis| axis >= BOARD_SIZE - 1 }.positive?
  end
end
