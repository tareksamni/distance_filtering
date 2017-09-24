# frozen_string_literal: true

class Inviter
  def initialize(input:, filter:, presenter:)
    @customers = Customer.from_input(input)
    @customers.select! do |customer|
      filter.accept?(customer)
    end
    @presenter = presenter
  end

  def display_invitees
    puts @presenter.format(@customers)
  end
end
