# 1)
class Brackets
  
  def initialize(string)
    @string = string
  end
  
  def valid?
    stack = []
    open_parentheses = ['{', '[', '(', '<']
    close_parentheses = ['}', ']', ')', '>']
    @string.each_char do |char|
      if open_parentheses.include?(char)
        stack.unshift(char)
        next
      end
      return false if close_parentheses.include?(char) && stack.empty?
      if close_parentheses.include?(char) && !stack.empty?
        if char == '}' && stack[0] == '{'
          stack.shift
        elsif char == ']' && stack[0] == '['
          stack.shift
        elsif char == ')' && stack[0] == '('
          stack.shift
        elsif char == '>' && stack[0] == '<'
          stack.shift
        else
          return false
        end  
      end      
    end
    return stack.empty?
  end

end
# 2)
class String
  
  def valid?
    stack = []
    open_parentheses = ['{', '[', '(', '<']
    close_parentheses = ['}', ']', ')', '>']
    self.each_char do |char|
      if open_parentheses.include?(char)
        stack.unshift(char)
        next
      end
      return false if close_parentheses.include?(char) && stack.empty?
      if close_parentheses.include?(char) && !stack.empty?
        if char == '}' && stack[0] == '{'
          stack.shift
        elsif char == ']' && stack[0] == '['
          stack.shift
        elsif char == ')' && stack[0] == '('
          stack.shift
        elsif char == '>' && stack[0] == '<'
          stack.shift
        else
          return false
        end  
      end      
    end
    return stack.empty?
  end

end

