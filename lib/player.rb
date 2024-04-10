# frozen_string_literal: false

require 'require_all'
require 'yaml'
require_all 'lib/pieces'

# Player class
class Player
  include Notation
  attr_reader :name, :is_white, :pieces

  def initialize(name, is_white, rows)
    @name = name
    @rows = rows
    @is_white = is_white
    @pieces = {}
  end

  def to_s
    @name
  end

  # Returns true if the move is legal
  def valid_move?(notation_move, board)
    piece = @pieces[notation_move[0]]
    target = @pieces[notation_move[1]]
    return false if piece.nil? || !target.nil?

    target_pos = notation_to_pos(notation_move[1])
    moves = piece.get_moves_to_pos(target_pos)
    piece.is_moveset_extended ? !cutoff?(moves, board) : piece.valid_move?(target_pos)
  end

  # Moves the piece to another position in the board
  def move_piece(notation, movement, board)
    piece = @pieces[notation]
    board.place_symbol(movement[0], nil)
    board.place_symbol(movement[1], piece)
    piece.pos = movement[1]
    piece.movement_counter += 1
    update_piece(notation)
  end

  # Updates the key of the piece in the hash
  def update_piece(notation)
    piece = @pieces[notation]
    @pieces.delete(notation)
    add_piece(piece)
  end

  # Returns the piece at pos
  def find_at(pos)
    @pieces[pos_to_notation(pos)]
  end

  # Creates a piece and adds it to the @pieces hash
  def create_piece(pos, type = 'p')
    case type.downcase
    when 'p'
      piece = Rook.new(pos, @is_white)
    end

    add_piece(piece)
  end

  # Adds a piece to the @pieces hash
  def add_piece(piece)
    @pieces[piece.to_notation] = piece
  end

  def each
    @pieces.each do |piece|
      yield(piece[1])
    end
  end

  private

  # Returns true if the path is blocked by another piece
  def cutoff?(positions, board)
    return true if positions.empty?

    positions.each_with_index do |pos, i|
      break if i >= positions.length - 1

      return true unless board.at(pos).nil?
    end
    false
  end
end
