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


  def convert_cents(number)
    output=[]
    value_set = {} #reverse
    @currency_set.each_pair{|k,v| value_set[v] = k}
    sorted_values = value_set.keys.sort.reverse #sorted desc to get the largest denominations first (99%25 before 99%1)

    if number > 0
      sorted_values.each do |divisor| #going through each key in reverse
        currency = value_set[divisor] #store the current currency
        quotient, number = number.divmod(divisor) #quotient = currency; resetting number to remainder
        output << "#{quotient} #{currency}" if quotient > 0
      end
    end
    output.join(", ")
  end


  def convert_currency(arr_input)
    total_cents = 0
    arr_input.each do |amount|
      @currency_set.keys.each do |key|
        number = amount.gsub!(/#{key}/,"").to_i #isolate # of current currency
        multiplier = number == nil ? 0 : number
        cents = multiplier * @currency_set[key] # (num * value)
        total_cents += cents #add it to the running total
      end
    end
    return "#{total_cents} cents"
  end


end