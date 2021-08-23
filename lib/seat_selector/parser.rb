require 'json'

module SeatSelector
  class Parser
    def self.parse(json_str)
      obj = JSON.parse(json_str)
      layout = obj["venue"]["layout"]
      Finder.new(obj["seats"], layout["rows"], layout["columns"])
    end
  end
end