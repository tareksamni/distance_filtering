# frozen_string_literal: true

require './autoload'
RSpec.describe Geo::Coordinate do
  let(:coordinate) { Geo::Coordinate.new(52.986375, -6.043701) }
  let(:invalid_lat_coordinate) { Geo::Coordinate.new('', -6.043701) }
  let(:invalid_lon_coordinate) { Geo::Coordinate.new(52.986375, '') }
  let(:invalid_coordinate) { Geo::Coordinate.new('a', 'b') }

  describe '#initialize' do
    it 'should assign latitude and longitude if input is numeric' do
      expect(coordinate.lat).to be(52.986375)
      expect(coordinate.lon).to be(-6.043701)
    end

    it 'should raise ArgumentError expcetion if input is not numeric' do
      expect { invalid_coordinate }.to raise_error(ArgumentError)
    end

    it 'should raise ArgumentError expcetion if latitude is not numeric' do
      expect { invalid_lat_coordinate }.to raise_error(ArgumentError)
    end

    it 'should raise ArgumentError expcetion if longitude is not numeric' do
      expect { invalid_lon_coordinate }.to raise_error(ArgumentError)
    end
  end
end
