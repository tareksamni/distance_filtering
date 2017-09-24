# frozen_string_literal: true

require './autoload'

puts Geo::Calculator.from_degree_coordinates(
  52.986375,
  -6.043701,
  53.3393,
  -6.2576841
).distance
