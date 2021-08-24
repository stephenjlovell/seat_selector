require 'spec_helper'

describe 'SeatSelector::AlphaConverter' do
  subject { SeatSelector::AlphaConverter }
  it { should respond_to(:to_i) }

  context "with valid input" do
    it "converts alpha names into equivalent numeric values" do
      # A -> 1; C -> 3; AA -> 27; AAA -> 703
      conv = SeatSelector::AlphaConverter
      expect(conv.to_i("A")).to eq(1)
      expect(conv.to_i("c")).to eq(3)
      expect(conv.to_i("AA")).to eq(27)
      expect(conv.to_i("BA")).to eq(53)
      expect(conv.to_i("AaA")).to eq(703)
    end
  end
end