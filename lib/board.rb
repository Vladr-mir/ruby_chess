# frozen_string_literal: false

require "colorize"

# Chess board definition
class ChessBoard
  attr_reader :size, :board

  def initialize(size)
    @size = size
    @board = Array.new(size) { Array.new(size) }
  end

  def place_symbol(pos, symbol)
    @board[pos[0]][pos[1]] = symbol
  end

  def at(pos)
    @board[pos[0]][pos[1]]
  end

  def to_s
    formatted = ""
    board.reverse.each_with_index do |row, row_i|
      formatted += (row_i + 1).to_s
      row.each_with_index { |square, squ_j| formatted << format_row(square, row_i + 1, squ_j + 1) }
      formatted += "\n"
    end
    formatted += " a b c d e f g h"
  end

  private

  def format_row(square, row_i, squ_j)
    formatted = square.nil? ? "\s\s" : "#{square}\s"
    if (row_i - squ_j).even?
      formatted.colorize(color: :black, background: :white)
    else
      formatted.colorize(color: :black, background: :light_blue)
    end
  end
end
