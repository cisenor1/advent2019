# frozen_string_literal: true
require 'dry-monads'

# Calculates the required fuel based on a module's mass
class FuelCalculator
  def call(mass:)
    return 0 if (mass == 0)
    fuel = [(mass/3) - 2,0].max
    fuel + call(mass: fuel)
  end
end
