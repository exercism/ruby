module BookKeeping
  VERSION = 1
end

module Brackets

  BRACKETS = {
    ')' => '(',
    ']' => '[',
    '}' => '{'
  }.freeze

  def self.paired?(str)
    stack = []
    str.each_char do |char|
      if BRACKETS.values.include?(char)
        stack.push(char)
      elsif BRACKETS.include?(char)
        return false if stack.empty?
        return false if stack.pop != BRACKETS[char]
      end
    end

    stack.empty?
  end
end
