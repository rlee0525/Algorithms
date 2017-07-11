# Remove duplicates from a string
def remove_dup(string)
  seen = {}
  new_string = ""

  string.each_char do |char|
    new_string += char unless seen[char]
    seen[char] = true
  end
  
  new_string
end

dup = "samrelkwamlkeqmwklemalksemaklw"

p remove_dup(dup) == "samrelkwq"

#Time: O(N)
#Space: O(2N)

# Reduce a 2D array where you need to sum the same elements and return them sorted by amount
def reduce_array(array)
  seen = Hash.new(0)

  (0...array.length).each do |row|
    (0...array[row].length).each do |col|
      current = array[row][col]
      seen[current] += current
    end
  end
  
  seen.values.sort
end


array = [
  [1, 4, 6, 4],
  [3, 1, 1, 7],
  [10, 5, 2, 5],
  [12, 10, 3, 2]
]

p reduce_array(array) == [3, 4, 6, 6, 7, 8, 10, 12, 20]

#Time: O(N * M + A + AlogA)
#Space: O(A)

# Implement Dequeue, Enqueue, FindMin()

class Queue
  def initialize
    @store = []
  end
  
  def dequeue
    @store.shift
  end
  
  def enqueue(val)
    @store << val
  end
  
  def find_min
    @store.min
  end
end

#Given a list of the retaurants' opening time, merge them if they have overlap and write some test cases. 
#(merge interval problem from the leetcode)

def merge_intervals(intervals)
  return [] if intervals.empty?

  intervals = intervals.sort_by { |interval| interval[0] }

  merged = []
  current = nil

  intervals.each do |interval|
    if !current
      current = interval
    elsif current[1] >= interval[0]
      current = [current[0], [current[1], interval[1]].max]
    else
      merged << current
      current = interval
    end
  end

  merged << current
  merged
end

intervals = [[1, 3], [2, 6], [8, 10], [15, 18]]

p merge_intervals(intervals) == [[1, 6], [8, 10], [15, 18]]















