# frozen_string_literal: true

RSpec.describe Presenters::MapSort do
  let(:presenter) { Presenters::MapSort.new(sorter: sorter) }
  describe '#initialize' do
    let(:sorter) { 'id' }
    it 'should assign sorter as a symbol' do
      expect(presenter.instance_variable_get(:@sorter)).to be(:id)
    end
  end

  describe '#format' do
    context 'invalid parameter' do
      let(:sorter) { :id }
      it 'raises an ArgumentError exception' do
        expect { presenter.format('asd') }.to raise_error(ArgumentError)
      end
    end

    context 'valid parameter' do
      let(:customers) do
        [Customer.new(2, 'Test1', 53.2451022, -6.238335),
         Customer.new(1, 'Test2', 53.2451022, -6.238335)]
      end
      let(:formatted_customers) { presenter.format(customers) }

      context 'sort by id' do
        let(:sorter) { :id }
        it 'sorts by id and map customers' do
          expect(formatted_customers).to be_an(Array)
          expect(formatted_customers.size).to be(2)
          expect(formatted_customers.first).to eq('Name: Test2, ID: 1')
          expect(formatted_customers.last).to eq('Name: Test1, ID: 2')
        end
      end

      context 'sory by name' do
        let(:sorter) { :name }
        it 'sorts by id and map customers' do
          expect(formatted_customers).to be_an(Array)
          expect(formatted_customers.size).to be(2)
          expect(formatted_customers.first).to eq('Name: Test1, ID: 2')
          expect(formatted_customers.last).to eq('Name: Test2, ID: 1')
        end
      end
    end
  end
end
