# Degenerate

[![Codeship Status for niftyn8/degenerate](https://codeship.com/projects/b2753af0-4a18-0132-8cc7-7ac1f13cf35d/status)](https://codeship.com/projects/46223)

Degenerate is a random data generator for use with [Generative](https://github.com/justincampbell/generative).

## Installation

Add this line to your application's Gemfile:

    gem 'degenerate'

And then execute:

    $ bundle install

Next require it in your `spec/spec_helper.rb` file:

    require 'degenerate'

Degenerate automatically registers several primative generators with generative.

## Usage

In your spec:

```rb
describe "#reverse" do
  generative do
    data(:string) { generate(:string) }

    it "should preserve length" do
      expect(string.reverse.length).to eq(string.length)
    end
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/degenerate/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
