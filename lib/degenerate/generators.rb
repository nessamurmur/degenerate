module Degenerate
  module Generators
    INTEGER_MAX = (2**(0.size * 8 -2) -1) / 2
    INTEGER_MIN = -(INTEGER_MAX)

    def self.integer
      ->(opts={}) { rand((opts[:min] || INTEGER_MIN)..(opts[:max] || INTEGER_MAX)) }
    end

    def self.string
      ->(opts={}) { random_string(opts[:size] || random_int) }
    end

    def self.array
      ->(opts={}) { [].class.new(opts[:size] || random_int) }
    end

    private

    def self.random_string(length)
      [].class.new(length) { "" << rand(0..3000) }.join
    end

    def self.random_int
      Degenerate::Generators.integer.call(min: 0, max: 9999)
    end
  end
end
