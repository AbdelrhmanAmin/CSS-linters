# Class for checker
# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/Metrics/MethodLength
# rubocop:disable Style/Documentation

require_relative '../lib/rules'
class Checker
  attr_accessor :errors

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
      lines = File.open(filepath)
      rules.space_before_brace(lines, errors)
      lines = File.open(filepath)
      rules.indent_block(lines, errors)
      lines = File.open(filepath)
      rules.hex_color(lines, errors)
      lines = File.open(filepath)
      rules.empty_block(lines, errors)
      lines = File.open(filepath)
      rules.empty_line(lines, errors)
      lines = File.open(filepath)
      rules.no_unit(lines, errors)
      lines = File.open(filepath)
      rules.missing_semicolon(lines, errors)
    end
    errors
  end
end

# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/Metrics/MethodLength
# rubocop:enable Style/Documentation
