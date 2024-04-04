# frozen_string_literal: false

require "./lib/pieces/piece"

# frozen_string_literal: true

RSpec.describe "Piece" do
  describe "#valid_move? (normal moveset)" do
    my_piece = Piece.new([3, 3], false)
    it "returns true when the given position is adjacent" do
      expect(my_piece.valid_move?([3, 4])).to eq(true)
    end

    it "returns false when the given position is diagonal" do
      expect(my_piece.valid_move?([4, 4])).to eq(false)
    end

    it "returns false when the given position is out of range" do
      expect(my_piece.valid_move?([6, 3])).to eq(false)
    end
  end

  describe "#valid_move? (extended moveset)" do
    my_piece = Piece.new([2, 2], true)
    it "returns true when the given position is adjacent" do
      expect(my_piece.valid_move?([2, 4])).to eq(true)
    end

    it "returns false when the given position is diagonal" do
      expect(my_piece.valid_move?([4, 4])).to eq(false)
    end

    it "returns true when the given position is not adjacent but reachable" do
      expect(my_piece.valid_move?([6, 2])).to eq(true)
    end

    it "returns false when the given position is not adjacent and unreachable" do
      expect(my_piece.valid_move?([6, 6])).to eq(false)
    end
  end

  describe "#get_moves_to_pos (Only for extended movesets)" do
    my_piece = Piece.new([3, 3], true)
    it "Returns an empty array when the desired position is not reachable" do
      expect(my_piece.get_moves_to_pos([6, 2])).to eq([])
    end

    it "Returns an array with the positions to get to the desired position" do
      steps = [
        [4, 3],
        [5, 3],
        [6, 3]
      ]
      expect(my_piece.get_moves_to_pos([6, 3])).to eq(steps)
    end
  end
end
