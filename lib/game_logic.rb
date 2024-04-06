# frozen_string_literal: false

require_relative "board"

# Logic For the game
class GameLogic
  attr_reader :story, :board

  def initialize(story = "")
    @story = story
    @board = ChessBoard.new(8)
  end

  def move_piece(old_pos, new_pos)
    piece = @board.at(old_pos)
    moves = piece.get_moves_to_pos(new_pos)

    return if piece.nil? || same_color?(piece, board.at(new_pos)) || cutoff?(moves) # piece.valid_move?(new_pos)

    piece.pos = new_pos
    @board.place_symbol(old_pos, nil)
    @board.place_symbol(piece.pos, piece)
  end

  private

  def cutoff?(positions)
    return true if positions.empty?

    # tracker = false
    positions.each do |pos, i|
      return true unless @board.at(pos).nil? || i == positions.length
    end
    false
  end

  def same_color?(pos1, pos2)
    return false if pos2.nil?

    pos1.is_white == pos2.is_white
  end
end
