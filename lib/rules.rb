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
      if line.include?(';')
        if line.match(/^(\s){2}[a-zA-Z]/)
          errors["indent_block"] << 'i'
        end
      end
    end
    errors
  end

  def lower_case(lines, errors)
    lines.each_with_index do |line , i|
      if line.include?('#')
        if line.match(/^#(?:[0-9a-f]{3}){1,2}$/)
          errors["lower_case"] << 'i'
        end
      end
    end
    errors
  end

  def empty_block(lines,errors)
    lines.each_with_index do |line, i|
      if line.match(/{\s|\n}/)
        errors["empty_block"] << 'i'
      end
    end
    errors
  end
  def no_unit(lines,errors)
    lines.each_with_index do |line, i|
      if line.include?(';')
        if line.match(/[\s](0\w|0%)/)
          errors["no_unit"] << 'i'
        end
      end
    end
    errors
  end
end