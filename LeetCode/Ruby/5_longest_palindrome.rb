# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

# Example:

# Input: "babad"

# Output: "bab"

# Note: "aba" is also a valid answer.
# Example:

# Input: "cbbd"

# Output: "bb"

# def longest_palindrome(string)
#   longest = ""

#   (0...string.length).each do |idx|
#     (idx...string.length).each do |idx2|
#       if is_palindrome?(string[idx..idx2])
#         current = string[idx..idx2] 
#         longest = longest.length > current.length ? longest : current
#       end
#     end
#   end
  
#   longest
# end

# def is_palindrome?(string)
#   (0...string.length / 2).each do |idx|
#     return false if string[idx] != string[string.length - idx - 1]
#   end

#   true
# end

# Brute Force - Time O(N^3) Space O(1)

# 0-0, 1-1, 2-2, 3-3, 4-4
#      0-1, 1-2, 2-3, 3-4
#           0-2, 1-3, 2-4
#                0-3, 1-4
#                     0-4

def longest_palindrome(string)
  return nil if string.empty?

  table = Array.new(string.length) { Array.new(string.length) }
  start_idx = 0
  end_idx = 0
  max = 0

  (0...string.length).each do |j|
    (0..j).each do |i|
      p i
      p j 
      if string[i] == string[j] && (i == j || j - i == 1 || table[i + 1][j - 1])
        table[i][j] = true

        if max <= (j - i + 1)
          start_idx = i
          end_idx = j
          max = j - i + 1
        end
      end
    end
  end

  string[start_idx..end_idx]
end
# Dynamic Programming - Time O(N^2 + N), Space O(N^2)

# def longest_palindrome(string)
#     test_str = "#" + string.split('').join('#') + "#"
#   string_length = string.length
#   l = []
#   i = 0
#   pal_len = 0

#   while i < string_length do
#     found_match = false

#     if i > pal_len && string[i - pal_len - 1] == string[i]
#       pal_len += 2
#       i += 1

#       next
#     end

#     l.push(pal_len)

#     s = l.length - 2
#     e = s - pal_len
#     s.downto(e + 1) do |j|
#       d = j - e - 1

#       if l[j] == d
#         pal_len = d
#         found_match = true
#         break
#       end

#       l.push([d, l[j]].min)
#     end

#     unless found_match
#       pal_len = 1
#       i += 1
#     end
#   end

#   l.push(pal_len)

#   l_len = l.length
#   s = l_len - 2
#   e = s - (2 * string_length + 1 - l_len)

#   s.downto(e + 1) do |i|
#     d = i - e - 1
#     l.push([d, l[i]].min)
#   end
  
#     l_max = l.max
#     l_index = l.index(l_max)

#     test_str[l_index - l_max..l_index + l_max].gsub('#', '')
# end

# Manacher's Algorithm -> O(N)