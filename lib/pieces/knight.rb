# frozen_string_literal: false

require_relative "piece"

# Knight piece
class Knight < Piece
  def initialize(pos, is_white)
    symbol = is_white ? "♘" : "♞"
    super(pos, false, symbol)
  end

  def moveset
    [
      [2, 1],
      [2, -1],
      [-2, 1],
      [-2, -1],
      [1, 2],
      [1, -2],
      [-1, 2],
      [-1, -2]
    ]
  end
end
