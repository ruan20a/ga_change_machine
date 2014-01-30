require 'pry'
require 'debugger'
require 'active_record'
require 'active_support/inflector'

class Machine
  attr_accessor :currency_set

  CURRENCY = {"penny" => 1, "nickel" => 5, "dime" => 10, "quarter" => 25}

  def initialize
    @currency_set = Machine::CURRENCY
  end

  #standardize methods are used to clean up inputs
  def standardize_currency(input)
    plurals = @currency_set.keys.map{|key| key.pluralize}
    plurals.each do |word|
      input.gsub!(/#{word}/,word.singularize)
    end #standardize to singular word for lookup

    input.gsub!(/\s/,"") #standardizes spacing
    input.split(",")
  end

  def standardize_cents(input)
    input.gsub!(/\D/,"") #in case people write cents
    input.to_i
  end

end