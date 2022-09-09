# frozen_string_literal: false

require './lib/pieces/piece'

RSpec.describe Piece do
  describe '#to_notation' do
    it 'returns the right notation' do
      piece1 = Piece.new('', 'P', [0, 0])
      piece2 = Piece.new('', 'P', [3, 3])

      expect(piece1.to_notation).to eql('Pa1')
      expect(piece2.to_notation).to eql('Pd4')
    end
  end

  describe '#valid_move?' do
    it 'uses the moveset correctly' do
      piece = Piece.new('', 'P', [0, 0])

      expect(piece.valid_move?([1, 0])).to eql(true)
    end
  end
end
