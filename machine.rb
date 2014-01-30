require 'pry'
require 'debugger'
require 'active_record'
require 'active_support/inflector'

class Machine
  attr_accessor :currency_set, :input, :is_currency

  CURRENCY = {"penny" => 1, "nickel" => 5, "dime" => 10, "quarter" => 25}

  def initialize(input, is_currency)
    @input = input
    @is_currency = is_currency
    @currency_set = Machine::CURRENCY
  end

  #this method is used to standardized the input necessary for the conversion
  def modify_input
    if @is_currency #TODO standardize words to singular!
      @input.gsub!(/\s/,"") #standardizes spacing
      @input.split(",")
    else
      @input.gsub!(/\D/,"") #in case people write cents
      @input.to_i #convert_cent needs an integer
    end
  end


  def convert_cent(number)

  end

  def convert_curr(number)

  end

end