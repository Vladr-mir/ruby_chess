# frozen_string_literal: false

# notation processing
class Notation
  COLUMN_HELPER = %w[a b c d e f g h].freeze

  def data=(notation)
    @piece = if notation.length > 2
               notation = notation[1..]
               notation[0]
             end
    @column = COLUMN_HELPER.find_index(notation[0])
    @row = notation[1].to_i - 1
  end

  def to_arr
    [@column, @row]
  end

  def to_s
    "#{@piece.upcase}#{COLUMN_HELPER[@column]}#{row}"
  end
end
