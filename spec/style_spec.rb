require_relative "../lib/rules.rb"

describe Rules do
  let(:check) {Rules.new}
  let(:wrong_color) { ['#00;'] }
  let(:right_color) { ['#000']}
  let(:wrong_indent) { ['.test {', 'background: blue;', '}'] }
  let(:right_indent) { ['.test {', '  background: blue;', '}'] }
  let(:right_brace) { ['.test {', '  background: blue;', '}'] }
  let(:wrong_brace) { ['.test{', '  background: blue;', '}'] }
  let(:right_block) { ['.test {', '  background: blue;', '}'] }
  let(:wrong_block) { ['.test {}'] }
  let(:wrong_line) { [".test {","\n \n" '}'] }
  let(:good_unit) { ['.test {', '  background: blue;', '  padding-top: 0;', '}'] }
  let(:bad_unit) { ['.test {', '  background: blue;', '  padding-top: 0rem;', '}'] }
  let(:missed_semicolon) { ['.test {', '  background: blue', '}'] }
  let(:with_semicolon) { ['.test {', '  background: blue;', '}'] }
  let (:errors) { {
    "space_brace" => [],
    "indent_block" => [],
    "hex_color" => [],
    "empty_block" => [],
    "empty_line" => [],
    "no_unit" => [],
    "missing_semicolon" => [],
    } }
  
  describe '#hex_color' do
    context 'Check hexcode color validaity' do
      it 'return an error if the hex length is not 3 or 6 or invalid hexcode' do
        expect(check.hex_color(wrong_color,errors)).to eql('HEX_COLOR/: Please correct the hex color to be only 3 or 6 letters or digits : On line 1')
      end
      
      it "return no error message" do
        expect(check.hex_color(right_color,errors)).to_not eql('HEX_COLOR/: Please correct the hex color to be only 3 or 6 letters or digits : On line 1')
      end
    end
  end
  
  describe '#indent_block' do
    context "Check indentation" do
      it 'return error for missing space' do 
        expect(check.indent_block(wrong_indent,errors)).to eql('INDENT_BLOCK/: Please add 2 spaces only : On line 2')
      end
      it 'return NO error for missing space' do 
        expect(check.indent_block(right_indent,errors)).to_not eql('INDENT_BLOCK/: Please add 2 spaces only : On line 2')
      end
    end
  end

  
  describe '#space_before_brace' do
    context "Check for space before opening brace" do
      it 'return error for missing space' do 
        expect(check.space_before_brace(wrong_brace,errors)).to eql('SPACE_BEFORE_BRACES/: Please add space before opening braces : On line 1')
      end
      it 'return NO error for missing space' do 
        expect(check.space_before_brace(right_brace,errors)).to_not eql('SPACE_BEFORE_BRACES/: Please add space before opening braces : On line 1')
      end
      
    end
  end

  describe '#empty_block' do
    context "Check for empty block" do
      it 'return error for empty block' do 
        expect(check.empty_block(wrong_block,errors)).to eql('EMPTY_BLOCK/: Please add content to the block or comment it : On line 1')
      end
      it 'return NO error for empty block' do 
        expect(check.empty_block(right_block,errors)).to_not eql('EMPTY_BLOCK/: Please add content to the block or comment it : On line 1')
      end
    end
  end

  describe '#empty_line' do
    context "Check for empty lines" do
      it 'return error for empty lines' do 
        expect(check.empty_line(wrong_line,errors)).to eql('EMPTY_LINE/: Please remove the extra empty line : On line 2')
      end
    end
  end

  describe '#no_unit' do
    context "Check for zero uniting" do
      it 'return error for un-necessary unit' do 
        expect(check.no_unit(bad_unit,errors)).to eql("NO_UNIT/: Please remove the unit, 0 zero doesn't need units : On line 3")
      end
      it 'return No error for un-necessary unit' do 
        expect(check.no_unit(good_unit,errors)).to_not eql("NO_UNIT/: Please remove the unit, 0 zero doesn't need units : On line 3")
      end
    end
  end

  describe '#missing_semicolon' do
    context "Check for missing semicolon" do
      it 'return error for missing semicolon' do 
        expect(check.missing_semicolon(missed_semicolon,errors)).to eql("MISSING_SEMICOLON/: Please add a semicolon (;) : On line 2")
      end
      it 'return No error' do 
        expect(check.missing_semicolon(with_semicolon,errors)).to_not eql("MISSING_SEMICOLON/: Please add a semicolon (;) : On line 2")
      end
    end
  end

end