require_relative 'generators/integer'

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
