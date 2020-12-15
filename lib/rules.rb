class Rules
  def space_before_brace(lines, errors)
    lines.each_with_index do |line, i|
      if line.include?('{')
        if line.match(/([a-zA-Z]){/)
          errors["space_brace"] << i
        end
      end
    end
    errors
  end

  def indent_block(lines, errors)
    lines.each_with_index do |line, i|
      if line.include?(':')
        if line.match(/^(\s){2}/)
          if line.match(/^(\s){3,}/)
            errors["indent_block"] << i
          end
        end
        unless line.match(/^(\s){2}/)
          errors["indent_block"] << i
        end
      end
    end
    errors
  end

  def hex_color(lines, errors)
    lines.each_with_index do |line , i|
      if line.include?('#')
        unless line.match(/#([a-f]|[0-9]){3,6}/)
          errors["hex_color"] << i
        end
      end
    end
    errors
  end

  def empty_block(lines,errors)

    lines.each_with_index do |line, i|
      if line.match(/\{\n*\}/)
        errors["empty_block"] << i
      end
    end
    errors
  end

   def empty_line(lines, errors)
    lines.each_with_index do |line, i|
      if line.match(/^\s+$/)
        errors["empty_line"] << i
      end
    end
    errors
  end
  
  def no_unit(lines,errors)
    lines.each_with_index do |line, i|
      if line.include?(':')
        if line.match(/[\s](0\w|0%)/)
          errors["no_unit"] << i
        end
      end
    end
     errors
  end
  
  def missing_semicolon(lines, errors)
    lines.each_with_index do |line, i|
      if line.include?(':')
        unless line.match(/;$/)
          errors["missing_semicolon"] << i
        end
      end
    end
     errors
  end
end