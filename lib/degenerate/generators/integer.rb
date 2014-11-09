module Degenerate::Generators
  class Integer
    INTEGER_MAX = (2**(0.size * 8 -2) -1) / 2
    INTEGER_MIN = -(INTEGER_MAX)

    attr_accessor :generator

    def initialize(opts={})
      @generator = random_number(opts[:min], opts[:max])
    end

    def random_number(min=nil, max=nil)
      min ||= INTEGER_MIN
      max ||= INTEGER_MAX
      ->() { rand(min..max) }
    end

    def to_data
      generator
    end
  end
end
