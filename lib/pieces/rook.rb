# frozen_string_literal: false

require_relative "piece"

# Rook piece
class Rook < Piece
  attr_reader :is_white

  def initialize(pos, is_white)
    @is_white = is_white
    symbol = @is_white ? "♖" : "♜"
    super(pos, true, symbol)
  end
end
