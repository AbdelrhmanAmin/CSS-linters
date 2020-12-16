# Class for checker
require_relative '../lib/rules'
class Checker
  attr_reader :errors

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
  end

  def check(filepath)
    unless filepath.empty?
      rules = Rules.new
      begin
      lines = File.open(filepath)
      rules.space_before_brace(lines, errors)
      lines.rewind()
      rules.indent_block(lines, errors)
      lines.rewind()
      rules.hex_color(lines, errors)
      lines.rewind()
      rules.empty_block(lines, errors)
      lines.rewind()
      rules.empty_line(lines, errors)
      lines.rewind()
      rules.no_unit(lines, errors)
      lines.rewind()
      rules.missing_semicolon(lines, errors)
      rescue StandardError => e
        errors['exception'] = 'INVALID'
      end
    end
  end
end
