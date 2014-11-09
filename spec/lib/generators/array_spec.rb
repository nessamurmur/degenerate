require_relative '../../spec_helper'

RSpec.describe Degenerate::Generators::Array do
  describe "#initialize" do
    generative do
      data(:generator) { described_class.new.to_data }

      it "returns an array" do
        expect(generator.call).to be_a(Array)
      end
    end
  end
end
