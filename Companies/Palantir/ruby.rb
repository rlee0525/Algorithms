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

def sumSubsets(arr)

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
