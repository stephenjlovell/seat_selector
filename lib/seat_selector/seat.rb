module SeatSelector
  class Seat
    attr_reader :row, :column
    attr_accessor :distance
  
    def initialize(params)
      @row = AlphaConverter.to_i(params.fetch("row"))
      @column = params.fetch("column")
      @id = params.fetch("id", @row.to_s + @column.to_s)
      @is_available = (params.fetch("status", "") == "AVAILABLE")
    end
  
    def available?
      @is_available
    end
  end
end