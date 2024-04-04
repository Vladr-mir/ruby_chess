# frozen_string_literal: false

require_relative "modules/arr_helper"

# Piece functionality and movility
class Piece
  include ArrHelper

  attr_reader :symbol
  attr_accessor :pos

  BOARD_SIZE = 8

  def initialize(pos, is_moveset_extended, symbol = "♙")
    @symbol = symbol
    @pos = pos
    @is_moveset_extended = is_moveset_extended
  end

  def to_s
    @symbol
  end

  def valid_move?(move)
    return false if out_of_bound?(move)

    if @is_moveset_extended
      valid_direction_extended?(move)
    else
      # !valid_direction_extended?(move).empty?
      valid_direction?(move)
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

  # Find if the given position is accesible using an extended moveset
  def valid_direction_extended?(pos)
    relative_distance = distance(pos)
    angle = find_angle(relative_distance)

    relative_distance = relative_distance.map { |axis| axis <=> 0 }
    moveset.any?(relative_distance) && (angle == 45 || angle.zero?)
  end

  # Finds if the given position is accesible using the moveset
  def valid_direction?(pos)
    relative_distance = distance(pos)
    !moveset.select { |direction| direction == relative_distance }.flatten.empty?
  end

  # Find the distance in each of the values to move to a given position
  def distance(pos)
    substract_arr(pos, @pos)
  end

  # Check if the given position is out of bound
  def out_of_bound?(pos)
    pos.count { |axis| axis.abs >= BOARD_SIZE }.positive?
  end

  # Find the angles given two positions
  def find_angle(dimensions)
    return 0 if dimensions[0].zero? || dimensions[1].zero?

    Math.atan(dimensions[0].abs / dimensions[1].abs.to_f) * (180 / Math::PI)
  end
end
