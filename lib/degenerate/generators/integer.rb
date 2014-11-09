module Degenerate::Generators
  class Integer
    INTEGER_MAX = (2**(0.size * 8 -2) -1) / 2
    INTEGER_MIN = -(INTEGER_MAX)

    attr_accessor :generator

    def initialize(limit=nil)
      srand(Time.now.to_i)
      @generator = if limit
        min, max = -limit, limit
        random_number(min, max)
      else
        random_number
      end
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
