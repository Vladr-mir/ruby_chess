# frozen_string_literal: false

# notation processing
module Notation
  COLUMN_HELPER = %w[a b c d e f g h].freeze

  # Returns the position given a valid notation
  def notation_to_pos(notation)
    notation = /[a-h]{1}[1-8]{1}/.match(notation)
    return [] if notation.empty?

    separate_elements(notation)
  end

  # Returns the notation given a valid position
  def pos_to_notation(pos)
    return "" if pos.length != 2

    "#{COLUMN_HELPER[pos[0]]}#{pos[1]}"
  end

  def valid_notation?(notation)
    notation = notation.downcase.split("\s")
    return false if notation.length > 2

    is_valid = true
    notation.each { |pos| is_valid &&= /[rnbkqp]?[a-h]{1}[1-8]{1}/.match?(pos) }
    is_valid
  end

  private

  def separate_elements(notation)
    column = COLUMN_HELPER.find_index(notation[0])
    row = notation[1].to_i - 1
    [row, column]
  end
end
