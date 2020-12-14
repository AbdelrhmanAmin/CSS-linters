require_relative '../lib/rules.rb'
class Checker
  def check(filepath)
    errors = {
    "space_brace" => [],
    "indent_block" => [],
    "lower_case" => [],
    "empty_block" => [],
    "empty_line" => [],
    "no_unit" => [],
  }
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
      lines = File.open(filepath)
    end
    errors
  end

end