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
      data(:any) { generate(:any) }

      it "registers an any generator" do
        class_name = any.class.to_s.downcase.to_sym
        expect(Degenerate::Generators::GENERATORS.map{|g| g == :integer ? :fixnum : g})
          .to include(class_name)
      end
    end
  end

  describe "http status generator" do
    generative do
      data(:status) { generate(:http_status) }

      it "registers an http status generator" do
        expect(Degenerate::Generators::HTTP_STATUSES)
          .to include(status)
      end
    end
  end
end
