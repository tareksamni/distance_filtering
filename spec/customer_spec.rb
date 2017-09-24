# frozen_string_literal: true

RSpec.describe Customer do
  describe '#initialize' do
    let(:customer) { Customer.new(2, 'Test1', 53.2451022, -6.238335) }
    it 'should assign id, name and location' do
      expect(customer.id).to be(2)
      expect(customer.name).to be('Test1')
      expect(customer.location.lat).to eq(53.2451022)
      expect(customer.location.lon).to eq(-6.238335)
    end
  end

  describe 'self.from_input' do
    let(:customers) { Customer.from_input(input) }

    context 'valid input' do
      let(:input) { Inputs::JSON.new('./spec/fixtures/customer.json') }

      it 'should return an array of Customers' do
        expect(customers).to be_an(Array)
        customer = customers.first
        expect(customer).to be_a(Customer)
        expect(customer.id).to be(12)
        expect(customer.name).to eq('Christina McArdle')
        expect(customer.location.lat).to eq(52.986375)
        expect(customer.location.lon).to eq(-6.043701)
      end
    end

    context 'invalid input' do
      let(:input) { Inputs::JSON.new('./spec/fixtures/invalid_customer.json') }
      it 'raises an ArgumentError exception' do
        expect { customers }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'self.valid_data_hash?' do
    let(:valid_data) do
      {
        'user_id' => 1,
        'name' => 'Test1',
        'latitude' => '53.2451022',
        'longitude' => -6.238335
      }
    end

    let(:invalid_data) do
      {
        'id' => 1,
        'name' => 'Test1',
        'latitude' => '53.2451022',
        'longitude' => -6.238335
      }
    end
    it 'return true if all required keys are presented' do
      expect(Customer.valid_data_hash?(valid_data)).to be_truthy
    end

    it 'return false if any required keys are not presented' do
      expect(Customer.valid_data_hash?(invalid_data)).to be_falsy
    end
  end
end
