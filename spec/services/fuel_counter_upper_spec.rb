require 'spec_helper'
require 'dry-monads'
require 'services/fuel_counter_upper'
require 'services/fuel_calculator'
require 'pry'

RSpec.describe FuelCounterUpper do
  let(:calculator) { FuelCalculator.new }
  let(:counter_upper) { described_class.new(calculator: calculator) } 
  subject { counter_upper.call(masses: masses) }
  
  context 'given a list of masses' do
    let(:masses) { [1,2,4,6,345345] }
    it 'executes the calculator on each value' do
      expect(calculator)
        .to receive(:call)
        .exactly(masses.size).times
      subject
    end
  end
  
  context 'invalid inputs' do
    context 'with a negative value' do
      let(:masses) { [-2, 23] }
      it 'will ignore negative values' do
        expect(calculator)
          .to receive(:call)
          .exactly(1).times
        subject
      end
    end
    
    context 'with string in array' do
      let(:masses) { ['string', 23] }
      it 'will ignore the string' do
        expect(calculator)
          .to receive(:call)
          .exactly(1).times
        subject
      end
    end

    context 'with nil in array' do
      let(:masses){ [nil,42] }
      it 'will ignore nil' do
        expect(calculator)
          .to receive(:call)
          .exactly(1).times
        subject
      end
    end
  end
end
