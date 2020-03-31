require 'spec_helper'
require 'services/fuel_calculator'

RSpec.describe FuelCalculator do
  let(:calculator) { FuelCalculator.new }
  subject { calculator.call(mass: mass) }
  context 'will calculate the fuel required for the fuel calculated, recursively' do
    let(:mass) { 100756 }
    let(:expected_fuel) { 50346 }
    it 'returns the total calculated fuel' do
      expect(calculator.call(mass: mass)).to eq expected_fuel
    end
  end
  context 'invalid masses' do
    context 'with nil' do
      let(:mass) { nil }
      it 'will raise an ArgumentError' do
        expect(subject.success?).to be false
        expect(subject.failure).to eq :nil_argument
      end
    end
    context 'with a string' do
      let(:mass) { 'mass' }
      it 'will raise an ArgumentError' do
        expect(subject.success?).to be false
        expect(subject.failure).to eq :non_numeric_argument
      end
    end
    context 'with a negative value' do
      let(:mass) { -2 }
      it 'will raise an ArgumentError' do
        expect(subject.success?).to be false
        expect(subject.failure).to eq :negative_argument
      end
    end
  end
end
