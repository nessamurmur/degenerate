module Degenerate::Generators
  class Array

    attr_reader :generator

    def initialize(opts={})
      @generator = ->() { [].class.new(opts[:size] || random_int) }
    end

    def to_data
      generator
    end

    def random_int
      Degenerate::Generators::Integer.new(min: 0, max: 9999).generator.call
    end
  end
end
