require 'spec_helper'

describe 'SeatSelector::Parser' do
  subject { SeatSelector::Parser }
  context "with a valid payload" do
    
    it "returns a Finder object" do
      data = IO.read('./spec/fixtures/valid_data.json')
      expect(subject.parse(data)).to respond_to(:get_best_seats)
    end
  end

  context "with a malformed payload" do
    it "detects missing keys" do
      data = IO.read('./spec/fixtures/invalid_key.json')
      expect { subject.parse(data) }.to raise_error(SeatSelector::Parser::UnprocessableEntity)
    end

    it "detects invalid data" do
      data = IO.read('./spec/fixtures/invalid_datatype.json')
      expect { subject.parse(data) }.to raise_error(SeatSelector::Parser::UnprocessableEntity)
    end

    it "detects malformed structures" do
      data = IO.read('./spec/fixtures/invalid_datatype.json')
      expect { subject.parse(data) }.to raise_error(SeatSelector::Parser::UnprocessableEntity)
    end
  end

end