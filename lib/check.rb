# Class for checker
require_relative '../lib/rules'
class Checker
  attr_reader :errors, :rules

  def initialize
    @errors = {
      'space_brace' => [],
      'indent_block' => [],
      'hex_color' => [],
      'empty_block' => [],
      'empty_line' => [],
      'no_unit' => [],
      'missing_semicolon' => []
    }
    @rules = Rules.new
  end
  def check (filepath)
    begin
      lines = File.open(filepath)
      rules.space_before_brace(lines, errors)
      lines.rewind
      rules.indent_block(lines, errors)
      lines.rewind
      rules.hex_color(lines, errors)
      lines.rewind
      rules.empty_block(lines, errors)
      lines.rewind
      rules.empty_line(lines, errors)
      lines.rewind
      rules.no_unit(lines, errors)
      lines.rewind
      rules.missing_semicolon(lines, errors)
    rescue StandardError
      errors['exception'] = 'INVALID'
    end
    errors
  end
end
