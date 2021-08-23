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
        venue = Venue.new(seats, layout.fetch("rows"), layout.fetch("columns"))
        Finder.new(venue)

      rescue StandardError
        raise UnprocessableEntity
      end
    end

    def self.build_available_seats(seats_args)
      seats_args.map { |args| Seat.new(args) }
    end
    private_class_method :build_available_seats
  
  end

end