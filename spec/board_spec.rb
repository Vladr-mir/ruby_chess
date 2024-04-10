# frozen_string_literal: false

require './lib/board'

# frozen_string_literal: true

RSpec.describe 'Board' do
  describe '#board' do
    it 'returns an empty grid' do
      data = Array.new(8) { Array.new(8) }
      board = ChessBoard.new(8)
      expect(data).to eq(board.board)
    end

    it 'returns symbol at pos_x pos_y' do
      board = ChessBoard.new(8)

      board.place_symbol([3, 4], 'x')
      expect(board.board[3][4]).to eq('x')
    end
  end
end
