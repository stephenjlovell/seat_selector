require 'json'

module SeatSelector
  class Parser
    class UnprocessableEntity < StandardError
    end

    def self.parse(json_str)
      begin
        obj = JSON.parse(json_str)
        seats = build_available_seats(obj.fetch("seats").values)
        layout = obj.fetch("venue").fetch("layout")
        rows = layout.fetch("rows")
        columns = layout.fetch("columns")
        
        venue = Venue.new(seats, rows, columns)
        Finder.new(venue)

      rescue StandardError
        raise UnprocessableEntity
      end
    end

    def self.build_available_seats(seats_args)
      seats_args.map { |args| build_seat(args) }
    end
    private_class_method :build_available_seats

    def self.build_seat(args)
      row = AlphaConverter.to_i(args.fetch("row"))
      column = args.fetch("column")
      id = args.fetch("id")
      is_available = (args.fetch("status") == "AVAILABLE")
    
      Seat.new({
        row: row,
        column: column,
        id: id,
        is_available: is_available,
      })
    end
    private_class_method :build_seat
  
  end

end