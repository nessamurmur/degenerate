require_relative '../spec_helper'

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

      data(:chars) { generate(:string, limit: 10).split('') }

      it "only uses characters from user input when given a list of characters" do
        string = Degenerate::Generators.string.call(of: chars)
        expect(string.split('').all? { |c| chars.include?(c) }).to be true
      end

      data(:limit) { generate(:integer, min: 0, max: 100) }

      it "limits strings to a given size" do
        expect(Degenerate::Generators.string.call(limit: limit).size)
          .to be <= limit
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

      let(:limit) { generate(:integer, min: 0, max: 100) }

      it "limits the array to a given size" do
        array = Degenerate::Generators.array.call(limit: limit)
        expect(array.size).to be <= limit
      end

      let(:generated) { generate([:integer, :string].sample) }

      it "generate an array from 1 given generator" do
        array = Degenerate::Generators.array.call(limit: limit, of: generated)
        result_classes = array.map(&:class)
        result_classes.all? { |c| expect(c).to eq(generated.class) }
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

  describe ".http_status" do
    generative do
      let(:statuses) { Degenerate::Generators::HTTP_STATUSES }

      it "returns a valid http status" do
        status = Degenerate::Generators.http_status.call
        expect(statuses).to include(status)
      end
    end
  end

  describe "all generators" do
    generative do
      data(:with_arg) { generate(:any_with_arg) }
      data(:without_arg) { generate(:any_without_arg) }

      it "accepts an argument" do
        expect { with_arg }.not_to raise_error
      end

      it "doesn't require an arg" do
        expect { without_arg }.not_to raise_error
      end

      Generative.register_generator(:any_with_arg) do |_|
        generator = Generative.manager.generators.keys.select { |g|
          !g.to_s.match(/any/)
        }.sample

        Generative.find_and_call(generator, limit: 10)
      end

      Generative.register_generator(:any_without_arg) do |_|
        generator = Generative.manager.generators.keys.select { |g|
          !g.to_s.match(/any/)
        }.sample

        Generative.find_and_call(generator)
      end
    end
  end
end
