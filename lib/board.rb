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
    board[pos[0]][pos[1]] = symbol
  end

  def pretty_print
    board.each_with_index do |row, row_i|
      formatted = ""
      row.each_with_index { |square, squ_j| formatted << format_row(square, row_i + 1, squ_j + 1) }
      puts formatted
    end
  end

  private

  def format_row(square, row_i, squ_j)
    formatted = if square.nil?
                  "\s\s"
                else
                  "#{square}\s"
                end

    if (row_i - squ_j).even?
      formatted.colorize(color: :black, background: :white)
    else
      formatted.colorize(color: :black, background: :blue)
    end
  end
end
