require 'degenerate/version'
require 'degenerate/generators'
require 'generative'

module Degenerate
  Generative.register_generator(:string, Generators.string)
  Generative.register_generator(:integer, Generators.integer)
  Generative.register_generator(:array, Generators.array)
end
