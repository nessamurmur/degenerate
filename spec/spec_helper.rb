require_relative '../lib/degenerate'
require 'generative'
require 'pry'

RSpec.configure do |config|
    config.default_formatter =  Generative::Formatter #--tag generative
end
