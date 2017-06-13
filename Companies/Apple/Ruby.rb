CODEFIGHTS

# Reverse the digits of the given integer.
#
# Example
#
# For x = 12345, the output should be
# reverseInteger(x) = 54321;
# For x = -4243, the output should be
# reverseInteger(x) = -3424.
# Input/Output
#
# [time limit] 4000ms (rb)
# [input] integer x
#
# Guaranteed constraints:
# -901000 ≤ x ≤ 901000.
#
# [output] integer

def reverseInteger(x)
  reversed = x.to_s.reverse.to_i
  x >= 0 ? reversed : reversed * -1
end

# Sudoku is a number-placement puzzle. The objective is to fill a 9 × 9 grid with numbers in such a way that each column, each row, and each of the nine 3 × 3 sub-grids that compose the grid all contain all of the numbers from 1 to 9 one time.
#
# Implement an algorithm that will check whether the given grid of numbers represents a valid Sudoku puzzle according to the layout rules described above. Note that the puzzle represented by grid does not have to be solvable.
#
# Example
#
# For
#
# grid = [['.', '.', '.', '1', '4', '.', '.', '2', '.'],
#         ['.', '.', '6', '.', '.', '.', '.', '.', '.'],
#         ['.', '.', '.', '.', '.', '.', '.', '.', '.'],
#         ['.', '.', '1', '.', '.', '.', '.', '.', '.'],
#         ['.', '6', '7', '.', '.', '.', '.', '.', '9'],
#         ['.', '.', '.', '.', '.', '.', '8', '1', '.'],
#         ['.', '3', '.', '.', '.', '.', '.', '.', '6'],
#         ['.', '.', '.', '.', '.', '7', '.', '.', '.'],
#         ['.', '.', '.', '5', '.', '.', '.', '7', '.']]
# the output should be
# sudoku2(grid) = true;
#
# For
#
# grid = [['.', '.', '.', '.', '2', '.', '.', '9', '.'],
#         ['.', '.', '.', '.', '6', '.', '.', '.', '.'],
#         ['7', '1', '.', '.', '7', '5', '.', '.', '.'],
#         ['.', '7', '.', '.', '.', '.', '.', '.', '.'],
#         ['.', '.', '.', '.', '8', '3', '.', '.', '.'],
#         ['.', '.', '8', '.', '.', '7', '.', '6', '.'],
#         ['.', '.', '.', '.', '.', '2', '.', '.', '.'],
#         ['.', '1', '.', '2', '.', '.', '.', '.', '.'],
#         ['.', '2', '.', '.', '3', '.', '.', '.', '.']]
# the output should be
# sudoku2(grid) = false.
#
# The given grid is not correct because there are two 1s in the second column. Each column, each row, and each 3 × 3 subgrid can only contain the numbers 1 through 9 one time.
#
# Input/Output
#
# [time limit] 4000ms (rb)
# [input] array.array.char grid
#
# A 9 × 9 array of characters, in which each character is either a digit from '1' to '9' or a period '.'.
#
# [output] boolean
#
# Return true if grid represents a valid Sudoku puzzle, otherwise return false.
def sudoku2(grid)
  check_rows(grid) && check_cols(grid) && check_squares(grid)
end

def check_vals(grid)
  grid.each do |row|
    hash = {}

    row.each do |val|
      next if val == '.'
      return false if val.to_i > 9 || val.to_i < 1 || hash[val.to_i]
      hash[val.to_i] = true
    end   
  end
  
  true
end

def check_rows(grid)
  check_vals(grid)
end

def check_cols(grid)
  cols = Array.new(9) { [] }

  grid.each_with_index do |row, r_idx|
    row.each_with_index do |val, c_idx|
      cols[c_idx] << val
    end
  end

  check_vals(cols)
end

def check_squares(grid)
  squares = Array.new(9) { [] }

  grid.each_with_index do |row, r_idx|
    row.each_with_index do |val, c_idx|
      squares[0] << val if r_idx.between?(0, 2) && c_idx.between?(0, 2)
      squares[1] << val if r_idx.between?(3, 5) && c_idx.between?(0, 2)
      squares[2] << val if r_idx.between?(6, 8) && c_idx.between?(0, 2)
      squares[3] << val if r_idx.between?(0, 2) && c_idx.between?(3, 5)
      squares[4] << val if r_idx.between?(3, 5) && c_idx.between?(3, 5)
      squares[5] << val if r_idx.between?(6, 8) && c_idx.between?(3, 5)
      squares[6] << val if r_idx.between?(0, 2) && c_idx.between?(6, 8)
      squares[7] << val if r_idx.between?(3, 5) && c_idx.between?(6, 8)
      squares[8] << val if r_idx.between?(6, 8) && c_idx.between?(6, 8)
    end
  end

  check_vals(squares)
end

# You are given an n x n 2D matrix that represents an image. Rotate the image by 90 degrees (clockwise).

# Try to solve this in-place - in a real interview, you will only be allowed to use O(1) additional memory.

# Example

# For

# a = [[1, 2, 3],
#      [4, 5, 6],
#      [7, 8, 9]]
# the output should be

# rotateImage(a) =
#     [[7, 4, 1],
#      [8, 5, 2],
#      [9, 6, 3]]
# Input/Output

# [time limit] 4000ms (rb)
# [input] array.array.integer a

# Guaranteed constraints:
# 1 ≤ a.length ≤ 100,
# a[i].length = a.length,
# 1 ≤ a[i][j] ≤ 104.

# [output] array.array.integer

def rotateImage(a)
  #transpose
  (0...a.length).each do |row|
    col = row + 1
    while col < a.length
      a[row][col], a[col][row] = a[col][row], a[row][col]
      col += 1
    end
  end
  
  #reverse each row
  mid = a.length / 2
  (0...a.length).each do |row|
    col_end = a.length - 1
    col = 0

    while col < mid
      a[row][col], a[row][col_end - col] = a[row][col_end - col], a[row][col]
      col += 1
    end
  end

  a  
end

# Note: Avoid using built-in functions that convert integers to their binary representations. Write the solution that uses O(k) operations per test, where k is the number of bits set to 1.

# Write a function that takes an unsigned (positive) integer and returns the number of 1 bits its binary representation contains. This value is also known as the integer's Hamming weight.

# Example

# For n = 13, the output should be
# numberOf1Bits(n) = 3.

# 13 is represented in binary as 1101, so the function should return 3.

# Input/Output

# [time limit] 4000ms (rb)
# [input] integer n

# Guaranteed constraints:
# 0 ≤ n ≤ 231 - 1.

# [output] integer

# built-in => to_s(2)
def numberOf1Bits(n)
  count = 0
  
  n.to_s(2).each_char do |char|
    count += 1 if char.to_i == 1
  end
  
  count -= 1 if n < 0
  
  count
end

# not built-in
def numberOf1Bits(n)
  count = 0

  while n != 0
    count += n & 1
    n >>= 1
  end
  
  count
end

# Note: Avoid using built-in std::nth_element (or analogous built-in functions in languages other than C++) when solving this challenge. Implement them yourself, since this is what you would be asked to do during a real interview.

# Find the kth largest element in an unsorted array. This will be the kth largest element in sorted order, not the kth distinct element.

# Example

# For nums = [7, 6, 5, 4, 3, 2, 1] and k = 2, the output should be
# kthLargestElement(nums, k) = 6;
# For nums = [99, 99] and k = 1, the output should be
# kthLargestElement(nums, k) = 99.
# Input/Output

# [time limit] 4000ms (rb)
# [input] array.integer nums

# Guaranteed constraints:
# 1 ≤ nums.length ≤ 105,
# -105 ≤ nums[i] ≤ 105.

# [input] integer k

# Guaranteed constraints:
# 1 ≤ k ≤ nums.length.

# [output] integer

def kthLargestElement(nums, k)
  nums.sort[-k]
end

# You have two version strings composed of several non-negative decimal fields that are separated by periods ("."). Both strings contain an equal number of numeric fields. Return 1 if the first version is higher than the second version, -1 if it is smaller, and 0 if the two versions are the same.

# The syntax follows the regular semver (semantic versioning) ordering rules:

# 1.0.5 < 1.1.0 < 1.1.5 < 1.1.10 < 1.2.0 < 1.2.2
# < 1.2.10 < 1.10.2 < 2.0.0 < 10.0.0
# Example

# For ver1 = "1.2.2" and ver2 = "1.2.0", the output should be
# higherVersion2(ver1, ver2) = 1;
# For ver1 = "1.0.5" and ver2 = "1.1.0", the output should be
# higherVersion2(ver1, ver2) = -1;
# For ver1 = "1.0.5" and ver2 = "1.00.05", the output should be
# higherVersion2(ver1, ver2) = 0.
# Input/Output

# [time limit] 4000ms (rb)
# [input] string ver1

# Correct version as a string.

# Guaranteed constraints:

# 1 ≤ ver1.length ≤ 350.

# [input] string ver2

# Correct version as a string.

# Guaranteed constraints:

# 1 ≤ ver2.length ≤ 350.

# [output] integer

# Return 1 if ver1 is higher than ver2, -1 if it's smaller, and 0 if the two versions are the same.

def higherVersion2(ver1, ver2)
  return 0 if ver1 == ver2

  ver1 = ver1.split(".").map(&:to_i)
  ver2 = ver2.split(".").map(&:to_i)

  (0...ver1.length).each do |idx|
    return 1 if ver1[idx] > ver2[idx]
    return -1 if ver1[idx] < ver2[idx]
  end

  0
end

# You have an array nums. We determine two functions to perform on nums. In both cases, n is the length of nums:

# fi(nums) = nums[0] · nums[1] · ... · nums[i - 1] · nums[i + 1] · ... · nums[n - 1]. (In other words, fi(nums) is the product of all array elements except the ithf.)
# g(nums) = f0(nums) + f1(nums) + ... + fn-1(nums).
# Using these two functions, calculate all values of f modulo the given m. Take these new values and add them together to get g. You should return the value of g modulo the given m.

# Example

# For nums = [1, 2, 3, 4] and m = 12, the output should be
# productExceptSelf(nums, m) = 2.

# The array of the values of f is: [24, 12, 8, 6]. If we take all the elements modulo m, we get:
# [0, 0, 8, 6]. The sum of those values is 8 + 6 = 14, making the answer 14 % 12 = 2.

# Input/Output

# [time limit] 4000ms (rb)
# [input] array.integer nums

# Guaranteed constraints:
# 2 ≤ nums.length ≤ 2 · 105,
# 1 ≤ nums[i] ≤ 100.

# [input] integer m

# Guaranteed constraints:
# 2 ≤ m ≤ 105.

# [output] integer

# too slow.
def productExceptSelf(nums, m)
  prefix = [1] * nums.length
  suffix = [1] * nums.length

  (1...nums.length).each do |idx|
    prefix[idx] = (prefix[idx - 1] * nums[idx - 1]) % m
    suffix[-idx - 1] = (suffix[-idx] * nums[-idx]) % m
  end
  
  total = 0

  (0...nums.length).each do |idx|
    total += (prefix[idx] * suffix[idx]) % m
  end
  
  total % m
end

# Given an integer len, count the number of different good strings that have a length of exactly len. A good string is a string for which the following conditions are true:

# A good string contains only lowercase English letters.
# Each character in a good string is unique.
# Exactly one character in a good string is lexicographically greater than the character that precedes it.
# Example

# For len = 2, the output should be
# goodStringsCount(len) = 325.

# If the first symbol is 'a', there are 25 possible good strings: "ab", "ac", ...
# If the first symbol is 'b', there are 24 possible good strings: "bc", "bd", ...
# ...
# If the first symbol is 'z', there are 0 possible good strings because there is no character that is lexicographically greater.
# There are 25 + 24 + 23 + ... + 0 = 325 good strings that have a length of 2.

# For len = 1, the output should be
# goodStringsCount(len) = 0.

# The 3rd rule for good strings can't be true if there is only one character in the string.

# Input/Output

# [time limit] 4000ms (rb)
# [input] integer len

# The length of good strings that you're looking for.

# Guaranteed constraints:
# 1 ≤ len ≤ 9.

# [output] integer

# The number of different good strings with a length of exactly len.

def goodStringsCount(len)
  nCr(26, len) * (2 ** len - len - 1)
end

def nCr(n, r)
  factorial(n) / (factorial(n - r) * factorial(r))
end

def factorial(n)
  (1..n).inject(:*) || 1
end

# You are climbing a staircase that has n steps. You can take the steps either 1 or 2 at a time. Calculate how many distinct ways you can climb to the top of the staircase.

# Example

# For n = 1, the output should be
# climbingStairs(n) = 1;

# For n = 2, the output should be
# climbingStairs(n) = 2.

# You can either climb 2 steps at once or climb 1 step two times.

# Input/Output

# [time limit] 4000ms (rb)
# [input] integer n

# Guaranteed constraints:
# 1 ≤ n ≤ 50.

# [output] integer

# It's guaranteed that the answer will fit in a 32-bit integer.

# recursion
def climbingStairs(n)
  return 0 if n <= 0
  return 1 if n == 1
  return 2 if n == 2
  
  climbingStairs(n - 1) + climbingStairs(n - 2)
end

# DP
def climbingStairs(n)
  return 0 if n <= 0
  return 1 if n == 1
  return 2 if n == 2

  n_minus_one = 2
  n_minus_two = 1
  all = 0

  (2...n).each do |i|
    all = n_minus_one + n_minus_two
    n_minus_two = n_minus_one
    n_minus_one = all
  end
  
  all
end

# You have a 2D binary matrix that's filled with 0s and 1s. In the matrix, find the largest square that contains only 1s and return its area.

# Example

# For

# matrix = [
#     ['1', '0', '1', '1', '1'],
#     ['1', '0', '1', '1', '1'],
#     ['1', '1', '1', '1', '1'],
#     ['1', '0', '0', '1', '0'],
#     ['1', '0', '0', '1', '0']
# ]
# the output should be
# maximalSquare(matrix) = 9.

# Input/Output

# [time limit] 4000ms (rb)
# [input] array.array.char matrix

# Guaranteed constraints:
# 0 ≤ matrix.length ≤ 100,
# 1 ≤ matrix[i].length ≤ 100,
# 0 ≤ matrix[i][j] ≤ 1.

# [output] integer

# An integer that represents the area of the largest square in the given matrix that is composed only of 1s.

def maximalSquare(matrix)

end
