# frozen_string_literal: true
require 'dry-monads'

# Calculates the required fuel based on a module's mass
class FuelCalculator
  include Dry::Monads[:result]
  def initialize(mass:)
    @mass = mass
  end

  def call
    Success(@mass/3 -2)
  end
end
