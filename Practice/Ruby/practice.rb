def is_unique(string)
  seen = {}
  string.chars.each do |char|
    return false if seen[char]
    seen[char] = true
  end

  true
end

p is_unique("hello") == false
p is_unique("hiewqklm") == true

class QuickSort
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def sort!(left_index = 0, right_index = string.length - 1)
    if left_index < right_index
      pivot_index = rand(left_index..right_index)
      new_pivot_index = partition(left_index, right_index, pivot_index)
      left = sort!(left_index, new_pivot_index - 1)
      right = sort!(new_pivot_index, right_index)
    end

    string
  end

  private

  def partition(left_index, right_index, pivot_index)
    pivot_value = string[pivot_index]
    string[pivot_index], string[right_index] = string[right_index], string[pivot_index]
    new_pivot_index = left_index

    (new_pivot_index...right_index).each do |idx|
      if string[idx] <= pivot_value
        string[new_pivot_index], string[idx] = string[idx], string[new_pivot_index]
        new_pivot_index += 1
      end
    end

    new_pivot_index
  end
end

def is_unique2(string)
  string = QuickSort.new(string).sort!

  (0...string.length - 1).each do |idx|
    return false if string[idx] == string[idx + 1]
  end

  true
end

p is_unique2("hello") == false
p is_unique2("hiewqklm") == true

def is_permutation(str1, str2)
  str1.chars.sort == str2.chars.sort
end

p is_permutation("hello", "olehl") == true
p is_permutation("heewewello", "oqwqlehl") == false

def is_permutation2(str1, str2)
  return false if str1.length != str2.length

  count = Hash.new(0)
  (0...str1.length).each do |idx|
    count[str1[idx]] += 1
    count[str2[idx]] -= 1
  end

  count.all? { |_, v| v == 0 }
end

p is_permutation2("hello", "olehl") == true
p is_permutation2("heewewello", "oqwqlehl") == false

def URLify(string)
  string.strip!.gsub(" ", "%20")
end

p URLify("Mr John Smith       ") == "Mr%20John%20Smith"

def palindrome_perm(string)
  count = Hash.new(0)

  string.chars.each do |char|
    count[char] += 1
  end

  odd_counts = 0

  count.each do |k, v|
    odd_counts += 1 if v.odd?
    return false if odd_counts > 1
  end

  true
end

p palindrome_perm("tactcoa") == true
p palindrome_perm("tactcoza") == false

def one_away(str1, str2)
  return false if (str1.length - str2.length).abs > 1

  if str1.length == str2.length
    difference = 0

    (0...str1.length).each do |idx|
      difference += 1 if str1[idx] != str2[idx]
      return false if difference > 1
    end
  else
    longer = str1.length > str2.length ? str1 : str2
    shorter = longer == str1 ? str2 : str1

    difference = 0
    idx1 = 0
    idx2 = 0

    while idx2 < shorter.length
      return false if difference > 1

      if longer[idx1] != shorter[idx2]
        difference += 1
        idx1 += 1
        next
      end

      idx1 += 1
      idx2 += 1
    end
  end

  true
end

p one_away("pale", "ple") == true
p one_away("pales", "pale") == true
p one_away("pale", "bale") == true
p one_away("pale", "bae") == false
p one_away("pale", "pale") == true
p one_away("pal", "pale") == true
p one_away("pael", "pale") == false
p one_away("pal", "pael") == true
p one_away("pale", "pa") == false
p one_away("pale", "jal") == false

def string_compression(string)
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

def rotate_matrix(matrix)
  (0...matrix.length).each do |row|
    col = 0
    while col < row
      matrix[row][col], matrix[col][row] = matrix[col][row], matrix[row][col]
      col += 1
    end
  end

  mid_line = matrix[0].length / 2

  (0...matrix.length).each do |row|
    col_end = matrix[0].length - 1
    (0...mid_line).each do |col|
      matrix[row][col], matrix[row][col_end - col] = matrix[row][col_end - col], matrix[row][col]
    end
  end

  matrix
end

p rotate_matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) == [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
p rotate_matrix([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]) == [[13, 9, 5, 1], [14, 10, 6, 2], [15, 11, 7, 3], [16, 12, 8, 4]]

def zero_matrix(matrix)
  (0...matrix.length).each do |row|
    (0...matrix[0].length).each do |col|
      if matrix[row][col] == 0
        matrix[0][col] = 0
        matrix[row][0] = 0
      end
    end
  end

  (0...matrix.length).each do |row|
    (0...matrix[0].length).each do |col|
      if matrix[0][col] == 0 || matrix[row][0] == 0
        matrix[row][col] = 0
      end
    end
  end

  matrix
end

p zero_matrix([[1, 2, 3], [4, 0, 6], [7, 8, 9]]) == [[1, 0, 3], [0, 0, 0], [7, 0, 9]]
p zero_matrix([[2, 3, 4], [6, 7, 8], [10, 11, 12], [14, 15, 0]]) == [[2, 3, 0], [6, 7, 0], [10, 11, 0], [0, 0, 0]]

def is_substring(str1, str2)
  str1.include?(str2)
end

def string_rotation(str1, str2)
  is_substring(str1 + str1, str2)
end

p is_substring("Hello", "olHle") == false
p is_substring("Hello", "ello") == true
p string_rotation("waterbottle", "erbottlewat") == true
