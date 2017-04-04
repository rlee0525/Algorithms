# # Time O(N)
# # Space O(N)
# def is_unique(str)
#   set = {}
#
#   str.chars.each do |char|
#     return false if set[char]
#     set[char] = true
#   end
#
#   true
# end
#
# p is_unique("hello") == false
# p is_unique("hiewqklm") == true
#
# # Time O(N^2)
# # Space O(1)
# def is_unique2(str)
#   (0...str.length).each do |i|
#     (i + 1...str.length).each do |j|
#       return false if str[i] == str[j]
#     end
#   end
#
#   true
# end
#
# p is_unique2("hello") == false
# p is_unique2("hiewqklm") == true
#
# class QuickSort
#   attr_reader :string
#
#   def initialize(string)
#     @string = string
#   end
#
#   def sort(left_index = 0, right_index = string.length - 1)
#     if left_index < right_index
#       pivot_index = rand(left_index..right_index)
#       new_pivot_index = partition(left_index, right_index, pivot_index)
#       sort(left_index, new_pivot_index - 1)
#       sort(new_pivot_index, right_index)
#     end
#
#     string
#   end
#
#   private
#
#   def partition(left_index, right_index, pivot_index)
#     pivot_value = string[pivot_index]
#     string[pivot_index], string[right_index] = string[right_index], string[pivot_index]
#     new_pivot_index = left_index
#     (new_pivot_index...right_index).each do |i|
#       if string[i] <= pivot_value
#         string[new_pivot_index], string[i] = string[i], string[new_pivot_index]
#         new_pivot_index += 1
#       end
#     end
#
#     new_pivot_index
#   end
# end
#
# # Time O(N log N)
# # Space O(1)
# def is_unique3(str)
#   str = QuickSort.new(str).sort
#
#   (0...str.length - 1).each do |i|
#     return false if str[i] == str[i + 1]
#   end
#
#   true
# end
#
# p is_unique3("hello") == false
# p is_unique3("hiewqklm") == true
#
# class QuickSort
#   attr_reader :string
#
#   def initialize(string)
#     @string = string
#   end
#
#   def sort(left_index = 0, right_index = string.length - 1)
#     if left_index < right_index
#       pivot_index = rand(left_index..right_index)
#       new_pivot_index = partition(left_index, right_index, pivot_index)
#       sort(left_index, new_pivot_index - 1)
#       sort(new_pivot_index, right_index)
#     end
#
#     string
#   end
#
#   private
#
#   def partition(left_index, right_index, pivot_index)
#     pivot_value = string[pivot_index]
#     string[pivot_index], string[right_index] = string[right_index], string[pivot_index]
#     new_pivot_index = left_index
#     (new_pivot_index...right_index).each do |i|
#       if string[i] <= pivot_value
#         string[new_pivot_index], string[i] = string[i], string[new_pivot_index]
#         new_pivot_index += 1
#       end
#     end
#
#     new_pivot_index
#   end
# end

# # ------------------------------------------------------------------------------------------------
#
# # Time O(N log N + M log M)
# # Space O(1)
# def is_permutation(str1, str2)
#   str1.chars.sort.join == str2.chars.sort.join
# end
#
# p is_permutation("hello", "olehl") == true
# p is_permutation("heewewello", "oqwqlehl") == false
#
# # Time O(N + N + M + M)
# # Space O(N + M)
# def is_permutation2(str1, str2)
#   count = Hash.new(0)
#   str1.chars.each do |char|
#     count[char] += 1
#   end
#
#   str2.chars.each do |char|
#     count[char] -= 1
#   end
#
#   count.all? { |_, v| v == 0 }
# end
#
# p is_permutation2("hello", "olehl") == true
# p is_permutation2("heewewello", "oqwqlehl") == false
#
# # More Optimized
# # Time O(3N)
# # Space O(N + M)
# def is_permutation3(str1, str2)
#   return false if str1.length != str2.length
#
#   count = Hash.new(0)
#   (0...str1.length).each do |idx|
#     count[str1[idx]] += 1
#     count[str2[idx]] -= 1
#   end
#
#   count.all? { |_, v| v == 0 }
# end
#
# p is_permutation3("hello", "olehl") == true
# p is_permutation3("heewewello", "oqwqlehl") == false

# ------------------------------------------------------------------------------------------------

# Time O(N)
# Space O(1)
# def URLify(string)
#   string.strip.gsub(" ", "%20")
# end
#
# p URLify("Mr John Smith       ") == "Mr%20John%20Smith"

# ------------------------------------------------------------------------------------------------

# Time O(N)
# Space O(N)
# def palindrome_perm(str)
#   count = Hash.new(0)
#
#   str.chars.each do |char|
#     count[char] += 1
#   end
#
#   odd_num = 0
#
#   count.each do |_, v|
#     odd_num += 1 if v.odd?
#     return false if odd_num > 1
#   end
#
#   true
# end
#
# p palindrome_perm("tactcoa") == true
# p palindrome_perm("tactcoza") == false
#
# ------------------------------------------------------------------------------------------------

# Time O(N)
# Space O(N)
def one_away(str1, str2)
  return true if str1 == str2
  return false if (str1.length - str2.length).abs > 1

  difference = 0

  if str1.length == str2.length
    (0...str1.length).each do |i|
      difference += 1 if str1[i] != str2[i]
      return false if difference > 1
    end
  else
    shorter = str1.length < str2.length ? str1 : str2
    longer = str1.length > str2.length ? str1 : str2
    idx1 = 0
    idx2 = 0
    while idx1 < longer.length && idx2 < shorter.length
      if longer[idx1] != shorter[idx2]
        return false if idx1 != idx2
      else
        idx2 += 1
      end

      idx1 += 1
    end
  end

  true
end

p one_away("pale", "ple") == true
p one_away("pales", "pale") == true
p one_away("pale", "bale") == true
p one_away("pale", "bae") == false

# ------------------------------------------------------------------------------------------------
