# Given a string, find the length of the longest substring without repeating characters.

# Examples:

# Given "abcabcbb", the answer is "abc", which the length is 3.

# Given "bbbbb", the answer is "b", with the length of 1.

# Given "pwwkew", the answer is "wke", with the length of 3. 
# Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

def length_of_longest_substring(s)
  seen = {}
  substring = []
  count = 0

  s.each_char do |char|
    while seen[char]
      first = substring.shift
      seen[first] = false
    end
    
    substring << char
    seen[char] = true

    count = count > substring.length ? count : substring.length
  end
  
  count
end

# Time O(N^2)
# Space O(N)