# frozen_string_literal: true

RSpec.describe Inputs::JSON do
  let(:input) { Inputs::JSON.new(file_path) }
  let(:file_path) { './spec/fixtures/customer.json' }

  describe '#initialize' do
    it 'should assign file_path and records' do
      expect(input.instance_variable_get(:@file_path)).to be(file_path)
      expect(input.records).to be_an(Array)
      expect(input.records.size).to eq(32)

      expect(input.records.first['user_id']).to be(12)
      expect(input.records.first['name']).to eq('Christina McArdle')
      expect(input.records.first['latitude']).to eq('52.986375')
      expect(input.records.first['longitude']).to eq('-6.043701')
    end
  end
end
