require 'json'

module SeatSelector

  def self.parse(json)
    obj = JSON.parse(str)
    layout = obj["venue"]["layout"]
    SeatSelector::Finder.new(obj["seats"], layout["rows"], layout["columns"])
  end

end