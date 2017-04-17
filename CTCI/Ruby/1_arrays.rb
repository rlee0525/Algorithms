# Time O(N)
# Space O(N)
def is_unique(str)
  set = {}

  str.chars.each do |char|
    return false if set[char]
    set[char] = true
  end

  true
end

p is_unique("hello") == false
p is_unique("hiewqklm") == true

# Time O(N^2)
# Space O(1)
def is_unique2(str)
  (0...str.length).each do |i|
    (i + 1...str.length).each do |j|
      return false if str[i] == str[j]
    end
  end

  true
end

p is_unique2("hello") == false
p is_unique2("hiewqklm") == true

class QuickSort
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def sort(left_index = 0, right_index = string.length - 1)
    if left_index < right_index
      pivot_index = rand(left_index..right_index)
      new_pivot_index = partition(left_index, right_index, pivot_index)
      sort(left_index, new_pivot_index - 1)
      sort(new_pivot_index, right_index)
    end

    string
  end

  private

  def partition(left_index, right_index, pivot_index)
    pivot_value = string[pivot_index]
    string[pivot_index], string[right_index] = string[right_index], string[pivot_index]
    new_pivot_index = left_index
    (new_pivot_index...right_index).each do |i|
      if string[i] <= pivot_value
        string[new_pivot_index], string[i] = string[i], string[new_pivot_index]
        new_pivot_index += 1
      end
    end

    new_pivot_index
  end
end

# Time O(N log N)
# Space O(1)
def is_unique3(str)
  str = QuickSort.new(str).sort

  (0...str.length - 1).each do |i|
    return false if str[i] == str[i + 1]
  end

  true
end

p is_unique3("hello") == false
p is_unique3("hiewqklm") == true

# ------------------------------------------------------------------------------

# Time O(N log N + M log M)
# Space O(1)
def is_permutation(str1, str2)
  str1.chars.sort == str2.chars.sort
end

p is_permutation("hello", "olehl") == true
p is_permutation("heewewello", "oqwqlehl") == false

# Time O(N + N + M + M)
# Space O(N + M)
def is_permutation2(str1, str2)
  count = Hash.new(0)
  str1.chars.each do |char|
    count[char] += 1
  end

  str2.chars.each do |char|
    count[char] -= 1
  end

  count.all? { |_, v| v == 0 }
end

p is_permutation2("hello", "olehl") == true
p is_permutation2("heewewello", "oqwqlehl") == false

# More Optimized
# Time O(3N)
# Space O(N + M)
def is_permutation3(str1, str2)
  return false if str1.length != str2.length

  count = Hash.new(0)
  (0...str1.length).each do |idx|
    count[str1[idx]] += 1
    count[str2[idx]] -= 1
  end

  count.all? { |_, v| v == 0 }
end

p is_permutation3("hello", "olehl") == true
p is_permutation3("heewewello", "oqwqlehl") == false

#--------------------------------------------------------------------------------

# Time O(N)
# Space O(1)
def URLify(string)
  string.strip.gsub(" ", "%20")
end

p URLify("Mr John Smith       ") == "Mr%20John%20Smith"

#--------------------------------------------------------------------------------

# Time O(N)
# Space O(N)
def palindrome_perm(str)
  count = Hash.new(0)

  str.chars.each do |char|
    count[char] += 1
  end

  odd_num = 0

  count.each do |_, v|
    odd_num += 1 if v.odd?
    return false if odd_num > 1
  end

  true
end

p palindrome_perm("tactcoa") == true
p palindrome_perm("tactcoza") == false

#--------------------------------------------------------------------------------

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

#--------------------------------------------------------------------------------

# Time O(N)
# Space O(N)
def string_compression(str)
  compressed = string[0]

  count = 1
  (1...string.length).each do |idx|
    if string[idx] == compressed[-1]
      count += 1
    else
      compressed += count.to_s
      compressed += string[idx]
      count = 1
    end
  end

  compressed += count.to_s

  compressed.length >= string.length ? string : compressed
end

p string_compression("aabcccccaaa") == "a2b1c5a3"
p string_compression("aabccccca") == "a2b1c5a1"
p string_compression("aabbcc") == "aabbcc"

#--------------------------------------------------------------------------------

# Time O(N^2)
# Space O(1)
def rotate_matrix(matrix)
  (0...matrix.length).each do |row|
    col = row + 1
    while col < matrix.length
      matrix[row][col], matrix[col][row] = matrix[col][row], matrix[row][col]
      col += 1
    end
  end

  (0...matrix.length).each do |row|
    start_col = 0
    end_col = matrix.length - 1

    while start_col < end_col
      matrix[row][start_col], matrix[row][end_col] = matrix[row][end_col], matrix[row][start_col]
      start_col += 1
      end_col -= 1
    end
  end

  matrix
end

p rotate_matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) == [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
p rotate_matrix([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]) == [[13, 9, 5, 1], [14, 10, 6, 2], [15, 11, 7, 3], [16, 12, 8, 4]]

#--------------------------------------------------------------------------------

# Time O(2N^2)
# Space O(2N)
def zero_matrix(matrix)
  rows_zero = {}
  cols_zero = {}

  (0...matrix.length).each do |row|
    (0...matrix[0].length).each do |col|
      if matrix[row][col] == 0
        rows_zero[row] = true
        cols_zero[col] = true
      end
    end
  end

  (0...matrix.length).each do |row|
    (0...matrix[0].length).each do |col|
      matrix[row][col] = 0 if rows_zero[row] || cols_zero[col]
    end
  end

  matrix
end

p zero_matrix([[1, 2, 3], [4, 0, 6], [7, 8, 9]]) == [[1, 0, 3], [0, 0, 0], [7, 0, 9]]
p zero_matrix([[2, 3, 4], [6, 7, 8], [10, 11, 12], [14, 15, 0]]) == [[2, 3, 0], [6, 7, 0], [10, 11, 0], [0, 0, 0]]

# Time O(2N^2)
# Space O(1)
def zero_matrix2(matrix)
  (0...matrix.length).each do |row|
    (0...matrix[0].length).each do |col|
      if matrix[row][col] == 0
        matrix[0][col] = 0
        matrix[row][0] = 0
      end
    end
  end

  (1...matrix.length).each do |row|
    (1...matrix[0].length).each do |col|
      matrix[row][col] = 0 if matrix[0][col] == 0 || matrix[row][0] == 0
    end
  end

  matrix
end

p zero_matrix2([[1, 2, 3], [4, 0, 6], [7, 8, 9]]) == [[1, 0, 3], [0, 0, 0], [7, 0, 9]]
p zero_matrix2([[2, 3, 4], [6, 7, 8], [10, 11, 12], [14, 15, 0]]) == [[2, 3, 0], [6, 7, 0], [10, 11, 0], [0, 0, 0]]

# ------------------------------------------------------------------------------

# Time O(N)
# Space O(N)
def string_rotation(str1, str2)
  is_substring(str1 + str1, str2)
end

def is_substring(str1, str2)
  str1.include?(str2)
end

p is_substring("Hello", "olHle") == false
p is_substring("Hello", "ello") == true
p string_rotation("waterbottle", "erbottlewat") == true

# ------------------------------------------------------------------------------
