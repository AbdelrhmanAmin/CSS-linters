class Rules
  
  def space_before_brace(lines, errors)
    err = 'Please add space before opening braces'
    lines.each_with_index do |line, i|
      if line.include?('{')
        if line.match(/([a-zA-Z]){/)
          @err_line = i+1
          errors["space_brace"] << i+1
        end
      end
    end
    return "SPACE_BEFORE_BRACES/: #{err} : On line #{@err_line}"
  end
  
  def indent_block(lines, errors)
    err ='Please add 2 spaces only'
    lines.each_with_index do |line, i|
      if line.include?(':')
        if line.match(/^(\s){2}/)
          if line.match(/^(\s){3,}/)
            @err_line = i+1
            errors["indent_block"] << i+1
          end
        end
        unless line.match(/^(\s){2}/)
          @err_line = i+1
          errors["indent_block"] << i+1
        end
      end
    end
    return "INDENT_BLOCK/: #{err} : On line #{@err_line}"
  end

  def hex_color(lines, errors)
    err = "Please correct the hex color to be only 3 or 6 letters or digits"
    lines.each_with_index do |line , i|
      if line.include?('#')
        unless line.match(/#([a-f]|[0-9]){3,6}/)
          @err_line = i +1
          errors["hex_color"] << i+1
        end
      end
    end
    return "HEX_COLOR/: #{err} : On line #{@err_line}"
  end
  
  def empty_block(lines,errors)
    err = "Please add content to the block or comment it"
    lines.each_with_index do |line, i|
      if line.match(/\{\n*\}/)
        @err_line = i + 1
        errors["empty_block"] << i+1
      end
    end
    return "EMPTY_BLOCK/: #{err} : On line #{@err_line}"
  end
  
  def empty_line(lines, errors)
    err = "Please remove the extra empty line"
    lines.each_with_index do |line, i|
      if line.match(/^\s+$/)
        @err_line = i + 1
        errors["empty_line"] << i+1
      end
    end
    return "EMPTY_LINE/: #{err} : On line #{@err_line}"
  end
  
  def no_unit(lines,errors)
    err = "Please remove the unit, 0 zero doesn't need units"
    lines.each_with_index do |line, i|
      if line.include?(':')
        if line.match(/[\s](0\w|0%)/)
          @err_line = i + 1
          errors["no_unit"] << i+1
        end
      end
    end
    return "NO_UNIT/: #{err} : On line #{@err_line}"
  end
  
  def missing_semicolon(lines, errors)
    err = "Please add a semicolon (;)"
    lines.each_with_index do |line, i|
      if line.include?(':')
        unless line.match(/;$/)
          @err_line = i + 1
          errors["missing_semicolon"] << i+1
        end
      end
    end
    return "MISSING_SEMICOLON/: #{err} : On line #{@err_line}"
  end
end