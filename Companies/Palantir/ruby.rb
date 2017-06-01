# CodeFights
# https://codefights.com/interview/7xqHvuKXT2oBJ26iq/companies/5xHhsMkmS5vrFDGLP

# You are given an array of integers in which every element appears twice, except for one. Find the element that only appears one time. Your solution should have a linear runtime complexity (O(n)). Try to implement it without using extra memory.

# Example

# For nums = [2, 2, 1], the output should be
# singleNumber(nums) = 1.

# Input/Output

# [time limit] 4000ms (rb)
# [input] array.integer nums

# Guaranteed constraints:
# 1 ≤ nums.length ≤ 104,
# -109 ≤ nums[i] ≤ 109.

# [output] integer

def singleNumber(nums)
  bitwise = nums[0]

  (1...nums.length).each do |idx|
    bitwise ^= nums[idx]
  end

  bitwise
end

# https://codefights.com/interview/xQYfEWxBsnFP4Jmjh/companies/5xHhsMkmS5vrFDGLP

# Given an array of integers, write a function that determines whether the array contains any duplicates. Your function should return true if any element appears at least twice in the array, and it should return false if every element is distinct.

# Example

# For a = [1, 2, 3, 1], the output should be
# containsDuplicates(a) = true.

# There are two 1s in the given array.

# For a = [3, 1], the output should be
# containsDuplicates(a) = false.

# The given array contains no duplicates.

# Input/Output

# [time limit] 4000ms (rb)
# [input] array.integer a

# Guaranteed constraints:
# 0 ≤ a.length ≤ 105,
# -2 · 109 ≤ a[i] ≤ 2 · 109.

# [output] boolean

def containsDuplicates(a)
  seen = {}
  
  a.each do |num|
    return true if seen[num]
    seen[num] = true
  end
  
  false
end

# https://codefights.com/interview/cXbXXx9jPxvMroggD/companies/5xHhsMkmS5vrFDGLP
# A cryptarithm is a mathematical puzzle for which the goal is to find the correspondence between letters and digits, such that the given arithmetic equation consisting of letters holds true when the letters are converted to digits.

# You have an array of strings crypt, the cryptarithm, and an an array containing the mapping of letters and digits, solution. The array crypt will contain three non-empty strings that follow the structure: [word1, word2, word3], which should be interpreted as the word1 + word2 = word3 cryptarithm.

# If crypt, when it is decoded by replacing all of the letters in the cryptarithm with digits using the mapping in solution, becomes a valid arithmetic equation containing no numbers with leading zeroes, the answer is true. If it does not become a valid arithmetic solution, the answer is false.

# Example

# For crypt = ["SEND", "MORE", "MONEY"] and

# solution = [['O', '0'],
#             ['M', '1'],
#             ['Y', '2'],
#             ['E', '5'],
#             ['N', '6'],
#             ['D', '7'],
#             ['R', '8'],
#             ['S', '9']]
# the output should be
# isCryptSolution(crypt, solution) = true

# When you decrypt "SEND", "MORE", and "MONEY" using the mapping given in crypt, you get 9567 + 1085 = 10652 which is correct and a valid arithmetic equation.

# For crypt = ["TEN", "TWO", "ONE"] and

# solution = [['O', '1'],
#             ['T', '0'],
#             ['W', '9'],
#             ['E', '5'],
#             ['N', '4']]
# the output should be
# isCryptSolution(crypt, solution) = false

# Even though 054 + 091 = 145, 054 and 091 both contain leading zeroes, meaning that this is not a valid solution.

# Input/Output

# [time limit] 4000ms (rb)
# [input] array.string crypt

# An array of three non-empty strings containing only uppercase English letters.

# Guaranteed constraints:
# crypt.length = 3,
# 1 ≤ crypt[i].length ≤ 14.

# [input] array.array.char solution

# An array consisting of pairs of characters that represent the correspondence between letters and numbers in the cryptarithm. The first character in the pair is an uppercase English letter, and the second one is a digit in the range from 0 to 9.

# Guaranteed constraints:
# solution[i].length = 2,
# 'A' ≤ solution[i][0] ≤ 'Z',
# '0' ≤ solution[i][1] ≤ '9',
# solution[i][0] ≠ solution[j][0], i ≠ j,
# solution[i][1] ≠ solution[j][1], i ≠ j.

# It is guaranteed that solution only contains entries for the letters present in crypt and that different letters have different values.

# [output] boolean

# Return true if the solution represents the correct solution to the cryptarithm crypt, otherwise return false.

def isCryptSolution(crypt, solution)
  decrypt_first = ""
  decrypt_second = ""
  decrypt_third = ""

  hash = {}

  solution.each do |pair|
    hash[pair[0]] = pair[1]
  end

  crypt[0].each_char do |char|
    decrypt_first += hash[char]
  end
  
  crypt[1].each_char do |char|
    decrypt_second += hash[char]
  end
  
  crypt[2].each_char do |char|
    decrypt_third += hash[char]
  end
  
  return false if (decrypt_first.length > 1 && decrypt_first[0] == "0") || (decrypt_second.length > 1 && decrypt_second[0] == "0") || (decrypt_third.length > 1 && decrypt_third[0] == "0")
  
  decrypt_first.to_i + decrypt_second.to_i == decrypt_third.to_i  
end

# https://codefights.com/interview/XhYvPHb96yJ3idYs5/companies/5xHhsMkmS5vrFDGLP

# Given an array of integers nums and an integer k, determine whether there are two distinct indices i and j in the array where nums[i] = nums[j] and the absolute difference between i and j is less than or equal to k.

# Example

# For nums = [0, 1, 2, 3, 5, 2] and k = 3, the output should be
# containsCloseNums(nums, k) = true.

# There are two 2s in nums, and the absolute difference between their positions is exactly 3.

# For nums = [0, 1, 2, 3, 5, 2] and k = 2, the output should be

# containsCloseNums(nums, k) = false.

# The absolute difference between the positions of the two 2s is 3, which is more than k.

# Input/Output

# [time limit] 4000ms (rb)
# [input] array.integer nums

# Guaranteed constraints:
# 0 ≤ nums.length ≤ 55000,
# -231 - 1 ≤ nums[i] ≤ 231 - 1.

# [input] integer k

# Guaranteed constraints:
# 0 ≤ k ≤ 35000.

# [output] boolean

def containsCloseNums(nums, k)
  hash = Hash.new { |h, k| h[k] = [] }

  nums.each_with_index do |num, idx|
    hash[num] << idx
  end

  hash.each do |key, v|
    if v.length > 1
      (0...v.length).each do |i|
        (i + 1...v.length).each do |j|
          return true if v[j] - v[i] <= k
        end
      end
    end
  end  

  false
end



# -----------------
# CodeFights

# sumSubsets
# https://codefights.com/interview/kEgA4DXcfXuriqGru/companies/5xHhsMkmS5vrFDGLP

# Given a sorted array of integers arr and an integer num, find all possible unique subsets of arr that add up to num. Both the array of subsets and the subsets themselves should be sorted in lexicographical order.
#
# Example
#
# For arr = [1, 2, 3, 4, 5] and num = 5, the output should be
# sumSubsets(arr, num) = [[1, 4], [2, 3], [5]].
#
# Input/Output
#
# [time limit] 4000ms (rb)
# [input] array.integer arr
#
# A sorted array of integers.
#
# Guaranteed constraints:
# 0 ≤ arr.length ≤ 50,
# 1 ≤ arr[i] ≤ num.
#
# [input] integer num
#
# A non-negative integer.
#
# Guaranteed constraints:
# 0 ≤ num ≤ 1000.
#
# [output] array.array.integer
#
# A sorted array containing sorted subsets composed of elements from arr that have a sum of num. It is guaranteed that there are no more than 1000 subsets in the answer.

def sumSubsets(arr, num)
  
end

p sumSubsets([1, 2, 3, 4, 5], 5) == [[1, 4], [2, 3], [5]]

# sumInRange
# https://codefights.com/interview/HMmEhePg2H6e7sCPo/companies/5xHhsMkmS5vrFDGLP

# You have an array of integers nums and an array queries, where queries[i] is a pair of indices (0-based). Find the sum of the elements in nums from the indices at queries[i][0] to queries[i][1] (inclusive) for each query, then add all of the sums for all the queries together. Return that number modulo 109 + 7.
#
# Example
#
# For nums = [3, 0, -2, 6, -3, 2] and queries = [[0, 2], [2, 5], [0, 5]], the output should be
# sumInRange(nums, queries) = 10.
#
# The array of results for queries is [1, 3, 6], so the answer is 1 + 3 + 6 = 10.
#
# Input/Output
#
# [time limit] 4000ms (rb)
# [input] array.integer nums
#
# An array of integers.
#
# Guaranteed constraints:
# 1 ≤ nums.length ≤ 105,
# -1000 ≤ nums[i] ≤ 1000.
#
# [input] array.array.integer queries
#
# An array containing sets of integers that represent the indices to query in the nums array.
#
# Guaranteed constraints:
# 1 ≤ queries.length ≤ 3 · 105,
# queries[i].length = 2,
# 0 ≤ queries[i][j] ≤ nums.length - 1,
# queries[i][0] ≤ queries[i][1].
#
# [output] integer
#
# An integer that is the sum of all of the sums gotten from querying nums, taken modulo 109 + 7.

def sumInRange(arr)

end

# sortByString
# https://codefights.com/interview/myCQFF3mJ9nx7z6cJ/companies/5xHhsMkmS5vrFDGLP

# Sort the letters in the string s by the order they occur in the string t.
#
# Example
#
# For s = "weather" and t = "therapyw", the output should be
# sortByString(s, t) = "theeraw";
#
# For s = "good" and t = "odg", the output should be
# sortByString(s, t) = "oodg".
#
# Input/Output
#
# [time limit] 4000ms (rb)
# [input] string s
#
# A string consisting only of lowercase English letters.
#
# Guaranteed constraints:
# 0 ≤ s.length ≤ 104.
#
# [input] string t
#
# A string consisting only of unique lowercase English letters. It is guaranteed that t contains all of the letters that occur in s.
#
# Guaranteed constraints:
# 0 ≤ t.length ≤ 26.
#
# [output] string

def sortByString(string)

end

# singleNumber
# https://codefights.com/interview/7xqHvuKXT2oBJ26iq/companies/5xHhsMkmS5vrFDGLP

# You are given an array of integers in which every element appears twice, except for one. Find the element that only appears one time. Your solution should have a linear runtime complexity (O(n)). Try to implement it without using extra memory.
#
# Example
#
# For nums = [2, 2, 1], the output should be
# singleNumber(nums) = 1.
#
# Input/Output
#
# [time limit] 4000ms (rb)
# [input] array.integer nums
#
# Guaranteed constraints:
# 1 ≤ nums.length ≤ 104,
# -109 ≤ nums[i] ≤ 109.
#
# [output] integer

def singleNumber()
end

# isCryptSolution
# https://codefights.com/interview/cXbXXx9jPxvMroggD/companies/5xHhsMkmS5vrFDGLP
# A cryptarithm is a mathematical puzzle for which the goal is to find the correspondence between letters and digits, such that the given arithmetic equation consisting of letters holds true when the letters are converted to digits.
#
# You have an array of strings crypt, the cryptarithm, and an an array containing the mapping of letters and digits, solution. The array crypt will contain three non-empty strings that follow the structure: [word1, word2, word3], which should be interpreted as the word1 + word2 = word3 cryptarithm.
#
# If crypt, when it is decoded by replacing all of the letters in the cryptarithm with digits using the mapping in solution, becomes a valid arithmetic equation containing no numbers with leading zeroes, the answer is true. If it does not become a valid arithmetic solution, the answer is false.
#
# Example
#
# For crypt = ["SEND", "MORE", "MONEY"] and
#
# solution = [['O', '0'],
#             ['M', '1'],
#             ['Y', '2'],
#             ['E', '5'],
#             ['N', '6'],
#             ['D', '7'],
#             ['R', '8'],
#             ['S', '9']]
# the output should be
# isCryptSolution(crypt, solution) = true
#
# When you decrypt "SEND", "MORE", and "MONEY" using the mapping given in crypt, you get 9567 + 1085 = 10652 which is correct and a valid arithmetic equation.
#
# For crypt = ["TEN", "TWO", "ONE"] and
#
# solution = [['O', '1'],
#             ['T', '0'],
#             ['W', '9'],
#             ['E', '5'],
#             ['N', '4']]
# the output should be
# isCryptSolution(crypt, solution) = false
#
# Even though 054 + 091 = 145, 054 and 091 both contain leading zeroes, meaning that this is not a valid solution.
#
# Input/Output
#
# [time limit] 4000ms (rb)
# [input] array.string crypt
#
# An array of three non-empty strings containing only uppercase English letters.
#
# Guaranteed constraints:
# crypt.length = 3,
# 1 ≤ crypt[i].length ≤ 14.
#
# [input] array.array.char solution
#
# An array consisting of pairs of characters that represent the correspondence between letters and numbers in the cryptarithm. The first character in the pair is an uppercase English letter, and the second one is a digit in the range from 0 to 9.
#
# Guaranteed constraints:
# solution[i].length = 2,
# 'A' ≤ solution[i][0] ≤ 'Z',
# '0' ≤ solution[i][1] ≤ '9',
# solution[i][0] ≠ solution[j][0], i ≠ j,
# solution[i][1] ≠ solution[j][1], i ≠ j.
#
# It is guaranteed that solution only contains entries for the letters present in crypt and that different letters have different values.
#
# [output] boolean
#
# Return true if the solution represents the correct solution to the cryptarithm crypt, otherwise return false.

def isCryptSolution

end

# findLongestSubarrayBySum
# https://codefights.com/interview/rm8sj82SYiJYApvKw/companies/5xHhsMkmS5vrFDGLP

# You have an unsorted array arr of non-negative integers and a number s. Find a longest contiguous subarray in arr that has a sum equal to s. Return two integers that represent its inclusive bounds. If there are several possible answers, return the one with the smallest left bound. If there are no answers, return [-1].
#
# Your answer should be 1-based, meaning that the first position of the array is 1 instead of 0.
#
# Example
#
# For s = 12 and arr = [1, 2, 3, 7, 5], the output should be
# findLongestSubarrayBySum(s, arr) = [2, 4].
#
# The sum of elements from the 2nd position to the 4th position (1-based) is equal to 12: 2 + 3 + 7.
#
# For s = 15 and arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], the output should be
# findLongestSubarrayBySum(s, arr) = [1, 5].
#
# The sum of elements from the 1st position to the 5th position (1-based) is equal to 15: 1 + 2 + 3 + 4 + 5.
#
# For s = 15 and arr = [1, 2, 3, 4, 5, 0, 0, 0, 6, 7, 8, 9, 10], the output should be
# findLongestSubarrayBySum(s, arr) = [1, 8].
#
# The sum of elements from the 1st position to the 8th position (1-based) is equal to 15: 1 + 2 + 3 + 4 + 5 + 0 + 0 + 0.
#
# Input/Output
#
# [time limit] 4000ms (rb)
# [input] integer s
#
# The sum of the subarray that you are searching for.
#
# Guaranteed constraints:
# 0 ≤ s ≤ 109.
#
# [input] array.integer arr
#
# The given array.
#
# Guaranteed constraints:
# 1 ≤ arr.length ≤ 105,
# 0 ≤ arr[i] ≤ 104.
#
# [output] array.integer
#
# An array that contains two elements that represent the left and right bounds of the subarray, respectively (1-based). If there is no such subarray, return [-1].

def findLongestSubarrayBySum(s, arr)

end

# CareerCup
# https://www.careercup.com/question?id=5756151524229120

# We have an array of objects A and an array of indexes B. Reorder objects in array A with given indexes in array B. Do not change array A's length.
#
# example:
#
#
# var A = [C, D, E, F, G];
# var B = [3, 0, 4, 1, 2];
#
# sort(A, B);
# // A is now [D, F, G, C, E];


def something

end

# CareerCup
# Below question was asked in online coding exam for Palantir Technology, Palo Alto, CA. Time given was 100 min. I could not complete it by the time.
#
# -----------------------------
#
# A group of farmers has some elevation data, and we’re going to help them understand how rainfall flows over their farmland.
# We’ll represent the land as a two-dimensional array of altitudes and use the following model, based on the idea that water flows downhill:
#
# If a cell’s four neighboring cells all have higher altitudes, we call this cell a sink; water collects in sinks.
# Otherwise, water will flow to the neighboring cell with the lowest altitude. If a cell is not a sink, you may assume it has a unique lowest neighbor and that this neighbor will be lower than the cell.
#
# Cells that drain into the same sink – directly or indirectly – are said to be part of the same basin.
#
# Your challenge is to partition the map into basins. In particular, given a map of elevations, your code should partition the map into basins and output the sizes of the basins, in descending order.
#
# Assume the elevation maps are square. Input will begin with a line with one integer, S, the height (and width) of the map. The next S lines will each contain a row of the map, each with S integers – the elevations of the S cells in the row. Some farmers have small land plots such as the examples below, while some have larger plots. However, in no case will a farmer have a plot of land larger than S = 5000.
#
# Your code should output a space-separated list of the basin sizes, in descending order. (Trailing spaces are ignored.)
#
# While correctness and performance are the most important parts of this problem, a human will be reading your solution, so please make an effort to submit clean, readable code. In particular, do not write code as if you were solving a problem for a competition.
#
# A few examples are below.
#
# Input:
# 3
# 1 5 2
# 2 4 7
# 3 6 9
#
#
# Output:
# 7 2
#
#
#
#
#
# The basins, labeled with A’s and B’s, are:
# A A B
# A A B
# A A A
#
#
#
#
# Input:
# 1
# 10
#
# Output:
# 1
#
#
# There is only one basin in this case.
#
#
#
#
# Input:
# 5
# 1 0 2 5 8
# 2 3 4 7 9
# 3 5 7 8 9
# 1 2 5 4 2
# 3 3 5 2 1
#
# Output:
# 11 7 7
#
#
#
#
#
#
# The basins, labeled with A’s, B’s, and C’s, are:
# A A A A A
# A A A A A
# B B A C C
# B B B C C
# B B C C C
#
#
#
# Input:
# 4
# 0 2 1 3
# 2 1 0 4
# 3 3 3 3
# 5 5 2 1
#
# Output:
# 7 5 4
#
#
#
#
#
# The basins, labeled with A’s, B’s, and C’s, are:
# A A B B
# A B B B
# A B B C
# A C C C
#
