# frozen_string_literal: false

require "./lib/modules/notation"

class Helper
  include Notation
end

RSpec.describe "Notation module" do
  describe "notation_to_pos" do
    it "Returns the resulting position" do
      helper = Helper.new
      expect(helper.notation_to_pos("g3")).to eq([2, 6])
    end
  end

  describe "valid_notation?" do
    it "Returns true when given a valid single position" do
      helper = Helper.new
      expect(helper.valid_notation?("h1")).to eq(true)
    end

    it "Returns true when given two valid positions" do
      helper = Helper.new
      expect(helper.valid_notation?("ph2 ph3")).to eq(true)
    end

    it "Returns false when given more than two valid positions" do
      helper = Helper.new
      expect(helper.valid_notation?("ph2 ph3 h4")).to eq(false)
    end

    it "Returns false when given an unvalid notation" do
      helper = Helper.new
      expect(helper.valid_notation?("randomword")).to eq(false)
    end
  end
end
