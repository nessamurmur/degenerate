require_relative '../../spec_helper'

RSpec.describe Degenerate::Generators::String do
  describe "#initializer" do
    generative do
      data(:generator) { described_class.new.to_data }

      it "returns a string" do
        expect(generator.call).to be_a(String)
      end
    end
  end
end
