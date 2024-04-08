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

  def pos_to_notation(pos)
    "#{COLUMN_HELPER[pos[0]]}#{pos[1]}"
  end

  private

  def separate_elements(notation)
    column = COLUMN_HELPER.find_index(notation[0])
    row = notation[1].to_i - 1
    [row, column]
  end
end
