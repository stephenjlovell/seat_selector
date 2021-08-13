class SeatFinder
  attr_reader :seats

  def initialize(seats_by_id, rows, columns)
    @rows = rows.to_i
    @columns = columns.to_i
    @best_row = 1
    @best_column = median(@columns)
    @seats = build_available_seats(seats_by_id).sort_by {|s| s.distance }
  end

  def available?
    @available_seats > 0
  end

  def best_seat
    @seats.first
  end

  private

  def distance_to_best_seat(row, column)
    (row - @best_row).abs + (column - @best_column).abs
  end

  def build_available_seats(seats_by_id)
    seats_by_id.values.each_with_object([]) do |val, seats|
      seat = Seat.new(val)
      if seat.available?
        seat.distance = distance_to_best_seat(seat.row, seat.column)
        seats << seat
      end
    end
  end

  # get median of contiguous integer range 1 to max
  def median(max)
    if max.even?
      max / 2
    else
      (max + 1) / 2
    end
  end
end

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

class AlphaConverter
  def self.letter_values
    @@letter_values ||= begin
      ("a".."z").each_with_object({}).with_index do |(chr, value_map), i|
        value_map[chr] = i + 1
      end
    end
  end

  # A -> 1; C -> 3; AA -> 27; AAA -> 703
  def self.to_i(alpha_str)
    alpha_str.each_char.inject(0) do |sum, c| 
      (sum * 26) + self.letter_values[c.downcase]
    end
  end
end