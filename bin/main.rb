#!/usr/bin/env ruby

require_relative '../lib/rules'
require_relative '../lib/check'
require 'colorize'

puts "Welcome To My Custom Linter!".bold
puts "Please enter the path of the file you want to hack!".red
filepath = gets.chomp
linter = Checker.new
linter.check(filepath)