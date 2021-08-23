Dir[File.dirname(__FILE__) + '/seat_selector/*.rb'].each { |file| require file }

module SeatSelector

  def self.parse(json_str)
    Parser.parse(json_str)
  end
end