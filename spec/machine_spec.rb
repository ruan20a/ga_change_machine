require 'pry'
require_relative 'spec_helper'
require_relative '../machine'

describe Machine do
  let(:machine){
    Machine.new()
  }

  describe "#standardize_currency" do
    it "removes space and becomes array" do
      input = "3 pennies, 4 dimes"
      output = machine.standardize_currency(input)
      expect(output).to match_array(["3penny","4dime"])
    end
  end

  describe "#standardize_cents" do
    it "turns input into num" do
      input = "99 cents"
      output = machine.standardize_cents(input)
      expect(output).to be 99
    end
  end

  describe "#convert_cents" do
    it "returns the lowest # of coins" do
      expect(machine.convert_cents(99)).to eq("3 quarter, 2 dime, 4 penny")
    end

    before(:each) do
      @random = (1..100).to_a.sample
      @output = machine.convert_cents(@random)
    end

    it "should return a pattern string" do
      @output.should match(/\D[a-z]/)
    end

    it "does not return 0 in a string" do
      @output.should_not include "0"
    end
  end

end
