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
```

Note on output, ruby as I know it isn't the best place for higher precision mathematics like this, the above sample will output the expected magnitude 1 1Hz frequency bucket, but it is slightly off by 8 parts in 100000 and there's an erroneous output of 7/100000 in the 3 Hz frequency bucket.  This is due to truncation with PI during calculation of the twiddle values.  This will be remedied in the future by pre-generating these values using a much more math-centric approach.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fft-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/fft-ruby/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Fft::Ruby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fft-ruby/blob/master/CODE_OF_CONDUCT.md).
