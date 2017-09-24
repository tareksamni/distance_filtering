# frozen_string_literal: true

require 'json'
module Inputs
  class JSON
    attr_accessor :records
    def initialize(file_path = './customer.json')
      @file_path = file_path
      @records = []
      read
    end

    def read
      File.open(@file_path, 'r') do |f|
        f.each_line do |line|
          @records << ::JSON.parse(line)
        end
      end
    rescue ::JSON::ParserError => e
      raise ArgumentError, "Invalid JSON in provided records file #{e}"
    end
  end
end
