require_relative '../spec_helper'

RSpec.describe Degenerate do
  describe "string generator" do
    generative do
      data(:string) { generate(:string) }

      it "registers a string generator" do
        expect(string).to be_a(String)
      end
    end
  end

  describe "integer generator" do
    generative do
      data(:integer) { generate(:integer) }

      it "registers a integer generator" do
        expect(integer).to be_a(Integer)
      end
    end
  end

  describe "array generator" do
    generative do
      data(:array) { generate(:array) }

      it "registers a array generator" do
        expect(array).to be_a(Array)
      end
    end
  end

  describe "any generator" do
    generative do
      data(:any) { generate(:array) }

      it "registers an any generator" do
        class_name = any.class.to_s.downcase.to_sym
        expect(Degenerate::Generators::GENERATORS)
          .to include(class_name)
      end
    end
  end
end
