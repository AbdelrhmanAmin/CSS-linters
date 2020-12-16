#!/usr/bin/env ruby

require_relative '../lib/rules'
require_relative '../lib/check'
require 'colorize'

puts '****Welcome To My Custom Ruby Linter!****'.bold
puts 'Please enter the path of the file you want to hack!'.yellow
filepath = gets.chomp
linter = Checker.new
linter.check(filepath) unless filepath.empty?
count = 0
linter.errors.each do |_key, value|
  count += 1 unless value.empty?
end
print "Congratualtions! Your project is free of errors! Get a cup of coffee!!\n".white.on_green.bold if count.zero?
puts 'Please Add Valid Directory'.bold.red if count == 1
if count >= 2
  linter.errors.each do |key, value|
    err = 'Please add space before opening braces' if key == 'space_brace'
    err = 'Please add 2 spaces only' if key == 'indent_block'
    err = 'Please correct the hex color to be only 3 or 6 letters or digits' if key == 'hex_color'
    err = 'Please add content to the block or comment it' if key == 'empty_block'
    err = 'Please remove the extra empty line' if key == 'empty_line'
    err = "Please remove the unit, 0 zero doesn't need units" if key == 'no_unit'
    err = 'Please add a semicolon (;)' if key == 'missing_semicolon'
    value.each do |line|
      print "#{key}/: #{err} : On line #{line}\n".red
    end
  end
  puts 'Sorry mate you still have to work!'.bold.red
end
