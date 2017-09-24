# frozen_string_literal: true

module Filters
  class Distance
    def initialize(src, max_distance)
      @src = src
      @max_distance = max_distance
    end

    def accept?(customer)
      Geo::Calculator.new(@src, customer.location).distance <= @max_distance
    end
  end
end
