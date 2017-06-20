# Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

# For example, given n = 3, a solution set is:

# [
#   "((()))",
#   "(()())",
#   "(())()",
#   "()(())",
#   "()()()"
# ]

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n, left = n, right = n, list = [], str = "")
  return if left > right

  generate_parenthesis(n, left - 1, right, list, str + "(") if left > 0
  generate_parenthesis(n, left, right - 1, list, str + ")") if right > 0

  if left == 0 && right == 0
    list << str
    return
  end

  list
end