# frozen_string_literal: true
require 'dry-monads'

# Calculates the required fuel based on a module's mass
class FuelCalculator
  include Dry::Monads[:result]

  def call(mass:)
    return Failure(:nil_argument) if mass == nil
    return Failure(:non_numeric_argument) if !mass.is_a? Numeric
    return Failure(:negative_argument) if mass < 0
    return 0 if (mass == 0)
    Success(mass/3 -2)
  end
end
