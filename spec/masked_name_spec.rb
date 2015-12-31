require 'spec_helper'

describe DataMasker::MaskedName do
  describe 'when given nil' do
    subject { described_class.new }

    it 'returns expected #first_name' do
      expect(subject.first_name).to eq 'Scot'
    end

    it 'returns expected #initial' do
      expect(subject.initial).to eq 'V'
    end

    it 'returns expected #last_name' do
      expect(subject.last_name).to eq 'Solano'
    end

    it 'returns expected #to_s' do
      expect(subject.to_s).to eq 'Scot V. Solano'
    end
  end

  it 'returns expected value for string name' do
    name = described_class.new('John Doe')
    expect(name.to_s).to eq 'Cecile Q. Price'
  end
end
