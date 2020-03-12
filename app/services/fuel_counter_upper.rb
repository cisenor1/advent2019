require 'dry-monads'

class FuelCounterUpper
include Dry::Monads[:result]
def initialize(calculator: FuelCalculator.new)
  @calculator = calculator
end

def call(masses: [])
  total = masses.map do |mass|
    next 0 unless (mass.is_a? Numeric) && (mass > 0)
    result = @calculator.call(mass: mass)
      result.value! if result.success?
    end.sum
    Success(total)
  end
end
