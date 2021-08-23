module SeatSelector
  class Venue
    attr_reader :total_rows, :total_columns, :available_seats
    
    def initialize(all_seats, total_rows, total_columns)
      @total_rows = total_rows
      @total_columns = total_columns
      @available_seats = build_available_seats(all_seats)
    end

    private

    def build_available_seats(all_seats)
      all_seats.each_with_object({}) do |s, seats|
        if s.available?
          seats[s.row] ||= {}
          seats[s.row][s.column] = s
        end
      end
    end
  end
end