# frozen_string_literal: false

require_relative "piece"

# Bishop piece
class Bishop < Piece
  def initialize(pos, is_white)
    symbol = is_white ? "♗" : "♝"
    super(pos, true, symbol)
  end

  def moveset
    [
      [1, 1],
      [-1, 1],
      [1, -1],
      [-1, -1]
    ]
  end
end
