require 'json'
require './seat_finder'

str = <<-JSON
{
  "venue": {
    "layout": {
      "rows": 10,
      "columns": 50
    }
  },
  "seats": {
    "a1": {
      "id": "a1",
      "row": "a",
      "column": 1,
      "status": "AVAILABLE"
    },
    "b5": {
      "id": "b5",
      "row": "b",
      "column": 5,
      "status": "AVAILABLE"
    },
    "h7": {
      "id": "h7",
      "row": "h",
      "column": 7,
      "status": "AVAILABLE"
    }
  }
}
JSON

obj = JSON.parse(str)
layout = obj["venue"]["layout"]
finder = SeatFinder.new(obj["seats"], layout["rows"], layout["columns"])

pp finder.best_seat