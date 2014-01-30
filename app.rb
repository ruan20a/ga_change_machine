require 'pry'
require_relative 'machine'

machine = Machine.new("3 pennies, 4 dimes",true)
a = machine.modify_input
print a