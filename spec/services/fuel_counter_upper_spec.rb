require 'spec_helper'
require 'dry-monads'
require 'services/fuel_counter_upper'

RSpec.describe FuelCounterUpper do
  let(:calculator) { double(FuelCalculator, call: Dry::Monads::Success(1)) }
  let(:counter_upper) { described_class.new(calculator: calculator) } 
  subject { counter_upper.call(masses: masses) }
  
  before do
    allow_any_instance_of(FuelCalculator)
      .to receive(:call)
      .and_return(1)
  end
  
  context 'given a list of masses' do
    let(:masses) { [1,2,4,6,345345] }
    it 'executes the calculator on each value' do
      expect(calculator)
        .to receive(:call)
        .exactly(masses.size).times
      subject
    end
    
    it 'returns successfully' do
      expect(subject.success?).to be true
    end
    
    it 'returns the fuel total' do
      expect(subject.value!).to eq 5 # double always returns 1 
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
