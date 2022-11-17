# frozen_string_literal: true

require 'bigdecimal'

module Fft
  # The CooleyTukey FFT algorithm is really just a specific case of a radix-n decimation-in-time
  # algorithm where n = 2.  It takes advantage of this assumption to allow for better reduction
  # of multiplicaitons through recursion to a base case.  In algorithm notation:
  class CooleyTukey
    attr_accessor :raw, :samples, :sig_figs

    # Initialize an instance of this algorithm with a sample set
    #
    # @param samples [Array<Float>] An array of sinusoidal sample data
    def initialize(samples)
      @samples = samples
      @sig_figs = 3
      validate!
    end

    # Run the fast fourier transform algorithm
    #
    # @return [Array<Float>] An array of fourier transform data
    def fft
      @raw = transform(samples)
      finalize
    end

    protected

    def validate!
      n = samples.length
      raise 'Sample set must be a power of 2' unless (n & (n-1)) == 0
    end

    def finalize
      n = samples.length
      nyquist = samples.length / 2

      out = []
      @raw.each_with_index do |datum, index|
        out << if index > nyquist
          0.0
        else
          BigDecimal(
            (2*(Math.sqrt((datum.real**2) + (datum.imag**2)))/n).to_s
          ).round(sig_figs).to_f
        end
      end

      out
    end

    # Transforms sinusoidal sample data into the frequency domain
    #
    # @param samples [Array<Integer>] An array of sinusoidal samples with a length that is a power of 2
    # @return [Array<Integer>] An array containing the transformed data
    def transform(samples)
      n = samples.length

      # Recursive base case
      if n == 1
        return samples
      end

      # This is the primary reason for using a power of 2 for sample length
      # it allows us to split the transforms evenly creating a balanced recursion tree
      even_samples, odd_samples = [], []
      samples.each_with_index do |datum, index|
        if index.even?
          even_samples.push(datum)
        else
          odd_samples.push(datum)
        end
      end

      even, odd = transform(even_samples), transform(odd_samples)

      results = [0] * n

      # This is another reason for making the assumption that n is a power of 2
      for j in 0..((n/2)-1)
        # Can and should be calculated before-hand with a specific set of sample data sizes (i.e. 1024, 4096, etc.)
        twiddle = Complex::polar(1.0,-2*BigDecimal(Math::PI.to_s)*j/n)

        q = twiddle * odd[j]
        results[j] = even[j] + q
        results[j + (n/2)] = even[j] - q
      end

      results
    end
  end
end
