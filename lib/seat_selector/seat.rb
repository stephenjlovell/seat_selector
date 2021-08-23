module SeatSelector
  class Seat
    attr_reader :row, :column, :distance
  
    def initialize(params, converter = AlphaConverter)
      @row = converter.to_i(params.fetch("row"))
      @column = params.fetch("column")
      @id = params.fetch("id")
      @is_available = (params.fetch("status") == "AVAILABLE")
    end

    def to_s
      @id.to_s.upcase
    end
  
    def available?
      @is_available
    end

    def set_distance!(median_column)
      @distance = (@row - 1).abs + (@column - median_column).abs
    end
  end
end