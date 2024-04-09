# frozen_string_literal: false

require_relative "board"
require "./lib/modules/notation"

# Logic For the game
class GameLogic
  include Notation
  attr_reader :story, :board, :players

  def initialize(story = "")
    @story = story
    @board = ChessBoard.new(8)
    @players = []
    @turn = 0
  end

  def add_player(player)
    @players << player
  end

  def current_player
    @players[@turn]
  end

  # Advances the turn
  def next_turn
    if @turn >= @players.length - 1
      @turn = 0
    else
      @turn += 1
    end
    @turn
  end

  # Asks the player to move the piece if the move is legal
  def move_piece(notation)
    return false unless valid_notation?(notation)

    notation = notation.split("\s")
    movement = notation.map { |pos| notation_to_pos(pos) }
    if current_player.valid_move?(notation, board)
      current_player.move_piece(notation[0], movement, @board)
      next_turn
      return true
    end
    false
  end

  # Places all of the players pieces on the board
  def place_all
    @players.each do |player|
      player.each { |piece| @board.place_symbol(piece.pos, piece) }
    end
  end
end
