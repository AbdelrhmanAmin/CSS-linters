require_relative '../lib/rules.rb'
class Checker
  attr_accessor :errors
  def initialize
    @errors = {
    "space_brace" => [],
    "indent_block" => [],
    "lower_case" => [],
    "empty_block" => [],
    "empty_line" => [],
    "no_unit" => [],
    }
  end
  def check(filepath)
  if !filepath.empty?
      lines = File.open(filepath)
      rules = Rules.new
      lines = File.open(filepath)
      rules.space_before_brace(lines,errors)
      lines = File.open(filepath)
      rules.indent_block(lines,errors)
      lines = File.open(filepath)
      rules.lower_case(lines,errors)
      lines = File.open(filepath)
      rules.empty_block(lines,errors)
      lines = File.open(filepath)
      rules.empty_line(lines,errors)
      lines = File.open(filepath)
      rules.no_unit(lines,errors)
    end
    errors
  end

end