module Degenerate
  module Generators
    INTEGER_MAX = (2**(0.size * 8 -2) -1) / 2
    INTEGER_MIN = -(INTEGER_MAX)

    def self.integer
      ->(opts={}) { rand((opts[:min] || INTEGER_MIN)..(opts[:max] || INTEGER_MAX)) }
    end

    def self.string
      ->(opts={}) {
        chars = opts[:of] || default_chars
        limit = opts[:limit] || random_int
        random_string_of(chars, limit)
      }
    end

    def self.array
      ->(opts={}) { [].class.new(opts[:size] || random_int) }
    end

    private

    def self.default_chars
      ('1'..'z').to_a
    end

    def self.random_string_of(chars, limit)
      [].class.new(random_int(limit)) { chars.sample }.join
    end

    def self.random_int(limit=9999)
      Degenerate::Generators.integer.call(min: 0, max: limit)
    end
  end
end
