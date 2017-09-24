# frozen_string_literal: true

module Geo
  class Coordinate
    attr_reader :lat, :lon
    def initialize(lat, lon)
      unless valid_params?(lat, lon)
        raise ArgumentError, 'Only numerics are allowed'
      end
      @lat = lat.to_f
      @lon = lon.to_f
    end

    def to_radians
      [@lat, @lon].map { |i| i * (Math::PI / 180) }
    end

    private

    def valid_params?(lat, lon)
      lat.is_a?(Numeric) && lon.is_a?(Numeric)
    end
  end
end
