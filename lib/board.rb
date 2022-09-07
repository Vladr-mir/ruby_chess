# frozen_string_literal: false

require 'colorize'

# Create a board to place chess pieces
class Board
  attr_reader :board_arr

  def initialize
    @board_arr = Array.new(8) { Array.new(8) }
  end

  def to_s
    formatted = ''
    @board_arr.each_with_index do |row, row_index|
      formatted += "\n#{row_index + 1}\s"
      formatted += format_row(row, row_index)
    end
    formatted += "\n\s\sa b c d e f g h"
  end

  private

  def format_row(row, index)
    formatted = ''
    row.each_with_index do |square, square_index|
      formatted += format_square(square, index, square_index)
    end
    formatted
  end

  def format_square(square, *index)
    background = (index[0] - index[1]).even? ? :white : :green
    formatted = square.nil? ? "\s\s" : "#{square}\s"
    formatted.colorize(background: background, color: :black)
  end
end
