# frozen_string_literal: true

module Geo
  class Calculator
    EARTH_RADIUS = 6371.0 # in km

    def initialize(point1, point2)
      @point1 = point1
      @point2 = point2
    end

    # rubocop:disable Metrics/AbcSize
    def distance
      # From: https://github.com/alexreisner/geocoder/blob/b5af9506a3462b57af0cecef597d2569e204c967/lib/geocoder/calculations.rb#L85

      # convert degrees to radians
      rad_point1 = @point1.to_radians
      rad_point2 = @point2.to_radians

      # compute deltas
      dlat = rad_point2[0] - rad_point1[0]
      dlon = rad_point2[1] - rad_point1[1]

      sin_dlat = Math.sin(dlat / 2)
      sin_dlon = Math.sin(dlon / 2)

      # rubocop:disable Metrics/LineLength
      a = sin_dlat**2 + Math.cos(rad_point1[0]) * sin_dlon**2 * Math.cos(rad_point2[0])
      # rubocop:enable Metrics/LineLength

      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
      c * EARTH_RADIUS
    end
    # rubocop:enable Metrics/AbcSize

    def self.from_degree_coordinates(
      point1_lat,
      point1_lon,
      point2_lat,
      point2_lon
    )

      point1 = Coordinate.new(point1_lat, point1_lon)
      point2 = Coordinate.new(point2_lat, point2_lon)
      new(point1, point2)
    end
  end
end
