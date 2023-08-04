# frozen_string_literal: false

require_relative "board"
require_relative "pieces/piece"

board = ChessBoard.new(8)
piece = Piece.new
print piece.valid_move?
print "\n"

board.place_symbol(piece.pos, piece)
board.pretty_print
