require_relative './lib/seat_selector'

json_str = <<-JSON
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
    "b6": {
      "id": "b6",
      "row": "b",
      "column": 6,
      "status": "UNAVAILABLE"
    },
    "b7": {
      "id": "b7",
      "row": "b",
      "column": 7,
      "status": "AVAILABLE"
    },
    "b8": {
      "id": "b8",
      "row": "b",
      "column": 8,
      "status": "AVAILABLE"
    },
    "b9": {
      "id": "b9",
      "row": "b",
      "column": 9,
      "status": "AVAILABLE"
    },
    "h7": {
      "id": "h7",
      "row": "h",
      "column": 7,
      "status": "AVAILABLE"
    },
    "h8": {
      "id": "h8",
      "row": "h",
      "column": 8,
      "status": "AVAILABLE"
    }
  }
}
JSON

finder = SeatSelector.parse(json_str)

pp finder.get_best_seats(3)