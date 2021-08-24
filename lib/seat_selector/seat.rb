module SeatSelector
  class Seat
    attr_reader :row, :column, :id, :distance
  
    def initialize(args)
      @row = args.fetch(:row)
      @column = args.fetch(:column)
      @id = args.fetch(:id)
      @is_available = args.fetch(:is_available, false)
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