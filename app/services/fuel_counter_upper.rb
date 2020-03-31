class FuelCounterUpper
  def initialize(calculator: FuelCalculator.new)
    @calculator = calculator
  end

  def call(masses: [])
    masses.map { |mass| @calculator.call(mass: mass) }.sum
  end
end
