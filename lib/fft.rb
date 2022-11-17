# frozen_string_literal: true

require_relative 'fft/version'
require_relative 'fft/cooley_tukey'

require 'pry'

module Fft
  class Error < StandardError; end

  # cooleytukey FFT
  # Prime factor FFT
  # Bruun's FFT
  # Rader's FFT

  def self.fft(samples, algorithm: Fft::CooleyTukey)
    algorithm.new(samples).fft
  end
end
