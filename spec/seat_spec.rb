require 'spec_helper'

describe 'SeatSelector::Seat' do
  let(:seat) { 
    SeatSelector::Seat.new({
      "id" => "h8",
      "row" => "h",
      "column" => 8,
      "status" => "AVAILABLE"
    }) 
  }

  it { expect(seat).to respond_to(:row, :column, :distance, :to_s, :available?) }

  it "calculates its distance to center-stage" do
    seat.set_distance!(25)
    expect(seat.distance).to eq(24)
    
    seat.set_distance!(50)
    expect(seat.distance).to eq(49)

    seat.set_distance!(8) 
    expect(seat.distance).to eq(7)
  end
end