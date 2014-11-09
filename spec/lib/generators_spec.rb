require_relative '../spec_helper.rb'

RSpec.describe Degenerate::Generators do
  describe ".integer" do
    generative do
      data(:integer) { Degenerate::Generators.integer }

      it "returns a proc" do
        expect(integer).to be_a(Proc)
      end

      it "'s generator returns a integer" do
        expect(integer.call).to be_a(Integer)
      end

      it "will never be greater than an imposed limit" do
        expect(integer.call).to be < described_class::INTEGER_MAX
      end

      it "will never be less than an imposed minimum" do
        expect(integer.call).to be > described_class::INTEGER_MIN
      end
    end
  end

  describe ".string" do
    generative do
      it "returns a proc" do
        expect(Degenerate::Generators.string).to be_a(Proc)
      end

      it "'s generator returns a string" do
        expect(Degenerate::Generators.string.call).to be_a(String)
      end
    end
  end

  describe ".array" do
    generative do
      it "returns a proc" do
        expect(Degenerate::Generators.array).to be_a(Proc)
      end

      it "'s generator returns a array" do
        expect(Degenerate::Generators.array.call).to be_a(Array)
      end
    end
  end

  describe ".random_int" do
    generative do
      it "is never greater than 9999" do
        expect(Degenerate::Generators.random_int).to be <= 9999
      end

      it "will never be negative" do
        expect(Degenerate::Generators.random_int).to be >= 0
      end
    end
  end
end
