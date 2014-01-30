require 'pry'
require_relative 'spec_helper'
require_relative '../machine'

describe Machine do
  let(:machine){
    Machine.new("3 pennies, 4 dimes",true)
  }

  let(:machine2){
    Machine.new("23",false)
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
        expect(@output).to be 23
      end
    end
  end

  describe "#convert_cent" do
  end
end
