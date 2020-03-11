# frozen_string_literal: true

# Calculates the required fuel based on a module's mass
class FuelCalculator
  def initialize(module_mass:)
    @module_mass = module_mass
  end

  def call
    module_mass
  end
end
