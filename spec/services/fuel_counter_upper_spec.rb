require 'spec_helper'
require 'services/fuel_counter_upper'

RSpec.describe FuelCounterUpper do
  context 'given a list of masses' do
    let(:masses) { [1,2,4,6,345345] }
    it 'executes the calculator on each value' do
      expect(calculator)
        .to receive(:call)
        .exactly(masses.size).times
    end
  end
  context 'invalid inputs' do
    let(:masses) { [nil,'foo', -1] }
  end
end
