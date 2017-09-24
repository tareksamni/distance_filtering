# frozen_string_literal: true

require './autoload'

dublin_office = Geo::Coordinate.new(53.3393, -6.2576841)
input = Inputs::JSON.new('./spec/fixtures/customer.json')
filter = Filters::Distance.new(dublin_office, 100)
presenter = Presenters::MapSort.new(sorter: :id)

Inviter.new(
  input: input,
  filter: filter,
  presenter: presenter
).display_invitees
