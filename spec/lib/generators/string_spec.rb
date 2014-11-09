require_relative '../../spec_helper'

RSpec.describe Degenerate::Generators::String do
  describe "#initializer" do
    generative do
      it "returns a string" do
        expect(subject.generator.call).to be_a(String)
      end
    end
  end
end
