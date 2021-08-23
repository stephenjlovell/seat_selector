module SeatSelector
  class Finder
    attr_reader :seats
  
    def initialize(seats_by_id, rows, columns)
      @total_rows = rows.to_i
      @total_columns = columns.to_i

      @seats = build_available_seats(seats_by_id)
    end
  
    def get_best_seats(seats_needed = 1)
      best_seat = nil
      best_distance = nil
      @seats.each do |r, seats_in_row| # skip rows with no open seats
        # search the current row
        seats_in_row.each do |c, seat|
          if seats_needed == 1
            if best_seat.nil? || best_seat.distance > seat.distance
              best_seat = seat
              best_distance = seat.distance
            end
          else
            # check rightward from current seat
            valid_group = (c + 1).upto(c + seats_needed - 1).all?{|i| seats_in_row.key?(i) }
            if valid_group
              distance = (c).upto(c + seats_needed - 1).inject(0) do |sum, i| 
                sum + seats_in_row[i].distance
              end
              if best_seat.nil? || best_distance > distance
                best_seat = seat
                best_distance = distance
              end
            end
          end
        end      
      end
      
      return [] if best_seat.nil?

      if seats_needed > 1
        seats_needed.times.map {|i| @seats[best_seat.row][best_seat.column + i] }
      else
        [best_seat]
      end
    end
  
    private
  
    def distance_to_best_seat(row, column, median_column)
      (row - 1).abs + (column - median_column).abs
    end
  
    def build_available_seats(seats_by_id)
      median_column = median(@total_columns)

      seats_by_id.values.each_with_object({}) do |val, seats|
        seat = Seat.new(val)
        if seat.available?
          seat.distance = distance_to_best_seat(seat.row, seat.column)
          seats[seat.row] ||= {}
          seats[seat.row][seat.column] = seat
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
end