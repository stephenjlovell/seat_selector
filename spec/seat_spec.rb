require 'spec_helper'

describe SeatSelector::Seat do
  let(:seat) { 
    SeatSelector::Seat.new({
      "id" => "h8",
      "row" => "h",
      "column" => 8,
      "status" => "AVAILABLE"
    }) 
  }

  it { expect(seat).to respond_to(:row, :column, :distance) }
end