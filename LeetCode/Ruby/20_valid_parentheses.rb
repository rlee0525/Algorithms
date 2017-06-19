# Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.

# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []
  pairs = {
    "(" => ")",
    "{" => "}",
    "[" => "]"
  }

  s.each_char do |char|
    if pairs[char]
      stack << char
    else
      last = stack.pop
      return false if pairs[last] != char
    end
  end

  stack.empty?
end