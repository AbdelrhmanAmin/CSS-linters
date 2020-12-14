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
  lines = File.open(filepath)
    if !filepath.empty?
      rules = Rules.new
      rules.space_before_brace(lines,errors)
      rules.indent_block(lines,errors)
      rules.lower_case(lines,errors)
      rules.empty_block(lines,errors)
      rules.empty_line(lines,errors)
      rules.no_unit(lines,errors)
    end
    p errors
  end

end