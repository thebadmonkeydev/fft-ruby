# Fft

A reference/educational implementation of the Fast Fourier Transform (FFT) algorithm.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add fft-ruby

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install fft-ruby

## Usage

```ruby
require 'fft'

# 1 Hz sine wave sampled at 8Hz
samples = {[0,0.707,1,0.707,0,-0.707, -1, -0.707])
Fft.fft(samples)

# First term is the offset, then since we have 8 samples at 8Hz we
# have 1Hz per index here showing an amplitude of 1 in the 1Hz bucket
=> [0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fft-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/fft-ruby/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Fft::Ruby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fft-ruby/blob/master/CODE_OF_CONDUCT.md).
