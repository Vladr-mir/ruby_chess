# frozen_string_literal: false

require './lib/notation'

RSpec.describe Notation do
  describe '#to_arr' do
    it 'returns the right arr' do
      notation = Notation.new
      notation.data = 'a1'
      expect(notation.to_arr).to eql([0, 0])
      notation.data = 'e5'
      expect(notation.to_arr).to eql([4, 4])
    end

    it 'strips the piece name' do
      notation = Notation.new
      notation.data = 'Re5'
      expect(notation.to_arr).to eql([4, 4])
    end
  end
end
