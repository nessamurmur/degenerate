require 'degenerate/version'
require 'degenerate/generators'
require 'generative'

module Degenerate
  Generative.register_generator(:string, Generators.string)
  Generative.register_generator(:integer, Generators.integer)
  Generative.register_generator(:array, Generators.array)
  Generative.register_generator(:any, Generators.any)
end
