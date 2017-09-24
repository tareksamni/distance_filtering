# frozen_string_literal: true

class Customer
  attr_accessor :id, :name, :location
  def initialize(id, name, lat, lon)
    @id = id
    @name = name
    @location = Geo::Coordinate.new(lat.to_f, lon.to_f)
  end

  def self.from_input(input)
    input.records.map do |record|
      raise ArgumentError, 'Invalid data hash' unless valid_data_hash?(record)
      new(record['user_id'],
          record['name'],
          record['latitude'],
          record['longitude'])
    end
  end

  def self.valid_data_hash?(data)
    %w[user_id name latitude longitude].all? do |key|
      data.key?(key)
    end
  end
end
