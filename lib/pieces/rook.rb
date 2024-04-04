# frozen_string_literal: false

require_relative "piece"
require "colorize"

# Rook piece
class Rook < Piece
  def initialize(pos, is_white)
    symbol = is_white ? "♖" : "♜"
    super(pos, true, symbol)
  end
end
