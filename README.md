# Seat Selector
A simple Ruby gem example. 

Given a JSON input representing the available seats at a public venue, 'seat_selector' finds the best available seat(s) (meaning closest to front row, center-stage). If more than one seat is requested, 'seat_selector' finds the best available group of adjacent seats (within the same row).

## Installation
To install:
```
$ gem install seat_selector
```
## Usage

```ruby
require 'seat_selector'

json_str = IO.read('path/to/data.json')

# Pass your JSON-formatted data to SeatSelector.
# You'll get back an array of the best available group of adjacent seats,
# or an empty array if no such group is available.
# See ./spec/fixtures/valid_data.json for examples of the supported format.
finder = SeatSelector.parse(json_str)

# request a single seat
seats = finder.get_best_seats(1)
# => [ <SeatSelector::Seat> ]

# request multiple seats
seats = finder.get_best_seats(3)
```

