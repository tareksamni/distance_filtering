# frozen_string_literal: true

RSpec.describe Filters::Distance do
  let(:filter) { Filters::Distance.new(src, max_distance) }
  let(:src) { Geo::Coordinate.new(53.3393, -6.2576841) }
  let(:max_distance) { 100 }

  describe '#initialize' do
    it 'should assign src and max_distance' do
      expect(filter.instance_variable_get(:@src)).to be(src)
      expect(filter.instance_variable_get(:@max_distance)).to be(max_distance)
    end
  end

  describe '#accept?' do
    context 'customer within filter range' do
      let(:customer) { Customer.new(1, 'Test', 53.2451022, -6.238335) }
      it 'should accept the customer' do
        expect(filter.accept?(customer)).to be_truthy
      end
    end

    context 'customer out of filter range' do
      let(:customer) { Customer.new(1, 'Test', 52.833502, -8.522366) }
      it 'should not accept the customer' do
        expect(filter.accept?(customer)).to be_falsy
      end
    end
  end
end
