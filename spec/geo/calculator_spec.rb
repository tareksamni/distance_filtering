# frozen_string_literal: true

RSpec.describe Geo::Calculator do
  describe '#initialize' do
    let(:calculator) { Geo::Calculator.new(point1, point2) }
    context 'valid Geo:Coordinate points' do
      let(:point1) { Geo::Coordinate.new(52.986375, -6.043701) }
      let(:point2) { Geo::Coordinate.new(53.3393, -6.2576841) }

      it 'should assign point1 and point2' do
        point1 = calculator.instance_variable_get(:@point1)
        point2 = calculator.instance_variable_get(:@point2)

        expect(point1).to be_a(Geo::Coordinate)
        expect(point2).to be_a(Geo::Coordinate)

        expect(point1.lat).to be(52.986375)
        expect(point1.lon).to be(-6.043701)

        expect(point2.lat).to be(53.3393)
        expect(point2.lon).to be(-6.2576841)
      end
    end

    context 'invalid points' do
      let(:point1) { [52.986375, -6.043701] }
      let(:point2) { [53.3393, -6.2576841] }
      it 'raises ArgumentError exception' do
        expect { calculator }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'self.from_degree_coordinates' do
    let(:calculator) do
      Geo::Calculator.from_degree_coordinates(point1_lat,
                                              point1_lon,
                                              point2_lat,
                                              point2_lon)
    end

    context 'valid coordinates' do
      let(:point1_lat) { 52.986375 }
      let(:point1_lon) { -6.043701 }
      let(:point2_lat) { 53.3393 }
      let(:point2_lon) { -6.2576841 }

      it 'should assign point1 and point2' do
        point1 = calculator.instance_variable_get(:@point1)
        point2 = calculator.instance_variable_get(:@point2)

        expect(point1).to be_a(Geo::Coordinate)
        expect(point2).to be_a(Geo::Coordinate)

        expect(point1.lat).to be(52.986375)
        expect(point1.lon).to be(-6.043701)

        expect(point2.lat).to be(53.3393)
        expect(point2.lon).to be(-6.2576841)
      end
    end

    context 'invalid coordinates' do
      let(:point1_lat) { 'A' }
      let(:point1_lon) { '-6.043701' }
      let(:point2_lat) { 53.3393 }
      let(:point2_lon) { -6.2576841 }

      it 'raises ArgumentError exception' do
        expect { calculator }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#distance' do
    let(:calculator) { Geo::Calculator.new(point1, point2) }

    context 'distance between Wicklow and Dublin' do
      let(:point1) { Geo::Coordinate.new(52.986375, -6.043701) }
      let(:point2) { Geo::Coordinate.new(53.3393, -6.2576841) }

      it 'should calculate distance betwene point1 and point2' do
        expect(calculator.distance.round(2)).to be(41.76)
      end
    end

    context 'distance between [0,0], [0,1]' do
      let(:point1) { Geo::Coordinate.new(0, 0) }
      let(:point2) { Geo::Coordinate.new(0, 1) }

      it 'should calculate distance betwene point1 and point2' do
        expect(calculator.distance.round).to be(111)
      end
    end
  end
end
