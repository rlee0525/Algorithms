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

def steal_houses_rec_index(array, pos)

end

p steal_houses_rec_index(houses1, []) == [1, 4]
p steal_houses_rec_index(houses1, []) == [0, 2, 4]
p steal_houses_rec_index(houses1, []) == [0, 2, 4, 6, 9]
