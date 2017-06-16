# '.' Matches any single character.
# '*' Matches zero or more of the preceding element.

# The matching should cover the entire input string (not partial).

# The function prototype should be:
# bool isMatch(const char *s, const char *p)

# Some examples:
# isMatch("aa","a") → false
# isMatch("aa","aa") → true
# isMatch("aaa","aa") → false
# isMatch("aa", "a*") → true
# isMatch("aa", ".*") → true
# isMatch("ab", ".*") → true
# isMatch("aab", "c*a*b") → true

def is_match(string, pattern)
  return string.empty? if pattern.empty?

  if pattern[1] == "*"
    is_match(string, pattern[2..-1]) || !string.empty? && (string[0] == pattern[0] || pattern[0] == ".") && is_match(string[1..-1], pattern)
  else
    !string.empty? && (string[0] == pattern[0] || pattern[0] == '.') && is_match(string[1..-1], pattern[1..-1])
  end
end

# Recursive - TLE solution