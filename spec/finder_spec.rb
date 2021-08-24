require 'spec_helper'

describe 'SeatSelector::Finder' do
  let(:finder) do
    data = IO.read('./spec/fixtures/valid_data.json')
    SeatSelector::parse(data)
  end

  it "returns an enumerable" do
    seats = finder.get_best_seats(1)
    expect(seats).to respond_to(:each)
    seats = finder.get_best_seats(2)
    expect(seats).to respond_to(:each)
  end

  context "when finding a single seat" do
    it "finds the best seat" do 
      seats = finder.get_best_seats(1)
      expect(seats.first.to_s).to eq("B9")
    end
  end

  context "when finding multiple seats" do
    it "finds the best 2-seat group" do 
      seats = finder.get_best_seats(2)
      expect(seats.map(&:to_s)).to contain_exactly("B8", "B9")
    end

    it "finds the best 3-seat group" do 
      seats = finder.get_best_seats(3)
      expect(seats.map(&:to_s)).to contain_exactly("H8","H9", "H10")
    end

    it "finds the best 4-seat group" do 
      seats = finder.get_best_seats(4)
      expect(seats.map(&:to_s)).to contain_exactly("H7", "H8","H9", "H10")
    end

    it "returns an empty enumerable when no matching group of seats is found" do
      seats = finder.get_best_seats(6)
      expect(seats).to be_empty
    end
  end
end