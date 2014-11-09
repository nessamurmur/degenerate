require_relative './integer'

module Degenerate::Generators
  class String

    attr_accessor :generator

    def initialize(opts={})
      @generator = ->() { random_string(opts[:length] || random_int) }
    end

    def to_data
      generator
    end

    private

    def random_string(length)
      Array.new(length) { "" << rand(0..3000) }.join
    end

    def random_int
      Degenerate::Generators::Integer.new(min: 0, max: 9999).generator.call
    end
  end
end
