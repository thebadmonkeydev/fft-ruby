# frozen_string_literal: true

module Fft
  describe CooleyTukey, type: :model do
    let(:samples) do
      [
        0, 0.707, 1, 0.707, 0, -0.707, -1, -0.707
      ]
    end

    subject { described_class.new(samples) }

    describe '#initialize' do
      context 'with valid samples' do
        it 'is successful' do
          expect{ described_class.new(samples) }.not_to raise_error
        end
      end

      context 'with non-power of 2 length sample data' do
        let(:samples) do
          [ 1, 2, 3 ]
        end

        it 'raises an error' do
          expect{ subject }.to raise_error 'Sample set must be a power of 2'
        end
      end
    end

    describe '#fft' do
      subject { described_class.new(samples).fft }

      it 'returns correct transform' do
        expect(subject).to eq [ 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ]
      end
    end
  end
end
