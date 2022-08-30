# frozen_string_literal: false

require_relative 'piece'

# Pawn chess piece
class Pawn < Piece
  def initialize(is_white, position)
    symbol = is_white ? '♙' : '♟'
    super(symbol, 'P', position)
  end
end
