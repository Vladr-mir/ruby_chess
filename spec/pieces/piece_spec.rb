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
end