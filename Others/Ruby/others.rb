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
