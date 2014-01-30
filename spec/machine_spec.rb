require 'pry'
require_relative 'spec_helper'
require_relative '../machine'

describe Machine do
  let(:machine){
    Machine.new("3 pennies, 4 dimes",true)
  }

  let(:machine2){
    Machine.new("99",false)
  }

  describe "#modify_input" do
    context "when currency_conversion" do
      it "removes space and becomes array" do
        @output = machine.modify_input
        expect(@output).to match_array(["3pennies","4dimes"])
      end
    end

    context "when not a currency_conversion" do
      it "turns input into num" do
        @output = machine2.modify_input
        expect(@output).to be 99
      end
    end
  end

  describe "#convert_cents" do

    it "returns the lowest # of coins" do
      expect(machine2.convert_cents(99)).to eq("3 quarter, 2 dime, 4 penny")
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
