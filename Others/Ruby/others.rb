# You have n houses with certain amount of money stashed in each house.
# You can not steal any adjacent houses. Given a list of non-negative
# integers representing the amount of money of each house, determine the
# maximum amount of money you can steal.

def steal_houses(array)
  return 0 if array.empty?

  amounts = [0, array[0]]

  i = 2
  while i <= array.length
    amounts[i] = [amounts[i - 1], amounts[i - 2] + array[i - 1]].max
    i += 1
  end

  amounts[-1]
end

houses1 = [10, 1000000, 50, 50, 101]
houses2 = [10, 10, 10, 10, 10]
houses3 = [10, 100, 120, 110, 110, 30, 500, 10, 2, 20]

p steal_houses(houses1) == 1000101
p steal_houses(houses2) == 30
p steal_houses(houses3) == 760

def steal_houses_rec(array)
  return 0 if array.empty?
  return array[0] if array.length == 1
  return [array[0], array[1]].max if array.length == 2
  return [array[0] + array[2], array[1]].max if array.length == 3

  array_first = steal_houses_rec(array[2..-1]) + array[0]
  array_second = steal_houses_rec(array[3..-1]) + array[1]

  [array_first, array_second].max
end

p steal_houses_rec(houses1) == 1000101
p steal_houses_rec(houses2) == 30
p steal_houses_rec(houses3) == 760

# def steal_houses_rec_index(array, pos)
#
# end
#
# p steal_houses_rec_index(houses1, []) == [1, 4]
# p steal_houses_rec_index(houses1, []) == [0, 2, 4]
# p steal_houses_rec_index(houses1, []) == [0, 2, 4, 6, 9]


# Given an expression string exp, examine whether the pairs
# and the orders of “{“,”}”,”(“,”)”,”[“,”]” are correct in exp.
# For example, the program should print 'balanced' for
# exp = “[()]{}{[()()]()}” and 'not balanced' for exp = “[(])”

def parenthesis_checker(string)
  pairs = {
    "{" => "}",
    "[" => "]",
    "(" => ")",
  }

  sets = {
    "{" => true,
    "}" => true,
    "[" => true,
    "]" => true,
    "(" => true,
    ")" => true
  }

  stack = []

  string.chars.each do |char|
    if pairs[char]
      stack << char
    elsif !sets[char]
      next
    else
      return false if stack.empty?
      if pairs[stack.pop] == char
        next
      else
        return false
      end
    end
  end

  stack.empty?
end

p parenthesis_checker("3") == true
p parenthesis_checker("{([])}") == true
p parenthesis_checker("()") == true
p parenthesis_checker("()[]") == true
p parenthesis_checker("[()]{}{[()()]()}") == true
p parenthesis_checker("[(])") == false

# you have this data set of pairs. and the first number in the pair is the parent of the second number
# return values that have 0 parents and values that have 1 parent
# so zeroParents in that case would be [1, 2, 4] and oneParents would be [5, 7, 8, 9]
# 1   2    4
#   \ /    / \
#    3    5   8
#     \  / \   \
#      6    7   9

# THEN find LCA =>  [6, 8] = 4

def find_loners(array)
  values = {}
  parents = {}

  array.each do |pair|
    values[pair[0]] = true unless values[pair[0]]
    values[pair[1]] = true unless values[pair[1]]

    if !parents[pair[1]]
      parents[pair[1]] = [pair[0]]
    else
      parents[pair[1]] << pair[0]
    end
  end

  result = [[], []]

  values.each do |k, _|
    if !parents[k]
      result[0] << k
    elsif parents[k].length == 1
      result[1] << k
    end
  end

  result
end

parent_child_pairs = [
  [1, 3], [2, 3], [3, 6], [5, 6],
  [5, 7], [4, 5], [4, 8], [8, 9]
]

p find_loners(parent_child_pairs) == [[1, 2, 4], [5, 7, 8, 9]]

def find_LCA(array, children)
  parents = Hash.new { |h, k| h[k] = [] }

  array.each do |pair|
    parents[pair[1]] << pair[0]
  end

  queue = [children[0]]
  seen = {}

  until queue.empty?
    current = queue.shift

    parents[current].each do |parent|
      seen[parent] = true
      queue << parent
    end
  end

  queue = [children[1]]

  until queue.empty?
    current = queue.shift

    return current if seen[current]
    parents[current].each do |parent|
      queue << parent
    end
  end

  -1
end

p find_LCA(parent_child_pairs, [6, 8]) == 4
p find_LCA(parent_child_pairs, [3, 5]) == -1
p find_LCA(parent_child_pairs, [7, 5]) == 5
