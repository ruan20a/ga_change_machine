require 'debugger'
require 'pry'
require_relative 'machine'

def ask(question)
  puts(question)
  gets.chomp.downcase
end

def accept?(ans)
  if ans == "y" || ans == "n"
    return ans
  else
    puts "Sorry I don't understand. Please try again."
  end
end

def return_value(is_currency)
  result = nil
  machine = Machine.new()
  if is_currency
    input = ask("Please enter currency (separate by commas):")
    input = machine.standardize_currency(input)
    result = machine.convert_currency(input)
  else
    input = ask("Please enter cents:")
    input = machine.standardize_cents(input)
    result = machine.convert_cents(input)
  end
  print result
end

#Screen Run Mode
ans = ask("Are you converting currency today? (Input Y/N)")
key = accept?(ans) #Checks to make sure we get the right input

if !key.nil?
  is_currency =  key == "y" ? true:false
  return_value(is_currency)
end




