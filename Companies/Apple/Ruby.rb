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