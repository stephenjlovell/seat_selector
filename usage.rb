require_relative './lib/seat_selector'

json_str = IO.read('./spec/fixtures/valid_data.json')
finder = SeatSelector.parse(json_str)

puts finder.get_best_seats(3)