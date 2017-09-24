# frozen_string_literal: true

module Presenters
  class MapSort
    def initialize(sorter:)
      @sorter = sorter.to_sym
    end

    def format(customers)
      unless customers.is_a?(Array) && customers.first.is_a?(Customer)
        raise ArgumentError,
              "array was expected but got #{customers.class}"
      end
      customers.sort_by(&@sorter).map do |customer|
        "Name: #{customer.name}, ID: #{customer.id}"
      end
    end
  end
end
