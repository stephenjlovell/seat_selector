module SeatSelector
  class Seat
    attr_reader :row, :column
    attr_accessor :distance
  
    def initialize(params, converter = AlphaConverter)
      @row = converter.to_i(params.fetch("row"))
      @column = params.fetch("column")
      @id = params.fetch("id")
      @is_available = (params.fetch("status", "") == "AVAILABLE")
    end

    def to_s
      @id.to_s.upcase
    end
  
    def available?
      @is_available
    end
  end
end