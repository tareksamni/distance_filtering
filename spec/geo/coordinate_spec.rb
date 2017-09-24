# frozen_string_literal: true

RSpec.describe Geo::Coordinate do
  let(:coordinate) { Geo::Coordinate.new(lat, lon) }

  describe '#initialize' do
    context 'input(lat, lon) is numeric' do
      let(:lat) { 52.986375 }
      let(:lon) { -6.043701 }
      it 'should assign latitude and longitude' do
        expect(coordinate.lat).to be(lat)
        expect(coordinate.lon).to be(lon)
      end
    end

    context 'input is not numeric' do
      let(:lat) { 'a' }
      let(:lon) { 'b' }
      it 'should raise ArgumentError expcetion' do
        expect { coordinate }.to raise_error(ArgumentError)
      end
    end

    context 'latitude is not numeric' do
      let(:lat) { 'a' }
      let(:lon) { -6.043701 }
      it 'should raise ArgumentError expcetion' do
        expect { coordinate }.to raise_error(ArgumentError)
      end
    end

    context 'longitude is not numeric' do
      let(:lat) { 52.986375 }
      let(:lon) { 'b' }
      it 'should raise ArgumentError expcetion' do
        expect { coordinate }.to raise_error(ArgumentError)
      end
    end
  end
end
