require_relative 'generators/integer'
require_relative 'generators/string'
require_relative 'generators/array'

module Degenerate
  module Generators
    def self.integer(limit)
      ::Generators::Integer.new(limit)
    end

    def self.string(length, regex)
      ::Generators::String.new(length, regex)
    end
  end
end
