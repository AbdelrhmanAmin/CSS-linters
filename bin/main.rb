#!/usr/bin/env ruby

require_relative '../lib/rules'
require_relative '../lib/check'
require 'colorize'

puts "****Welcome To My Custom Linter!****".bold
puts "Please enter the path of the file you want to hack!".yellow
filepath = gets.chomp
linter = Checker.new
linter.check(filepath)
count = 0
linter.errors.each do |key, value|
  if !value.empty?
    count+=1
  end
end
if count.zero?
  print "Congratualtions! Your project is free of errors! Get a cup of coffee!!\n".white.on_green.bold
end
if count > 0
  linter.errors.each do |key, value|
    if key == "space_brace"
      err = 'Please add space before opening braces'
    end
    if key == "indent_block"
      err ='Please add 2 spaces only'
    end
    if key == "hex_color"
      err = "Please correct the hex color to be only 3 or 6 letters or digits"
    end
    if key == "empty_block"
      err = "Please add content to the block or comment it"
    end
    if key == 'empty_line'
      err = "Please remove the extra empty line"
    end
    if key == "no_unit"
      err = "Please remove the unit, 0 zero doesn't need units"
    end
    if key == "missing_semicolon"
      err = "Please add a semicolon (;)"
    end
    value.each do |line|
      print "#{key}/: #{err} : On line #{line+=1}\n".red
    end
  end
  puts 'Sorry mate you still have to work!'.bold.red
end