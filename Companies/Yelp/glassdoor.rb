# 1) Invert a binary tree

def invert_tree(root)
  return root unless root

  temp = root.left
  root.left = invert_tree(root.right)
  root.right = invert_tree(temp)

  root
end

# 2) Reduce a 2D array where you need to sum the same elements 
# and return them sorted by amount

def reduce_array(arr)
  seen = Hash.new(0)

  arr.each do |nested|
    nested.each do |el|
      seen[el] += el
    end
  end

  seen.values.sort
end

two_arr = [[1, 4], [2, 7], [3, 1], [2, 2], [4, 10]]
p reduce_array(two_arr)

# 3) Implement Dequeue, Enqueue, FindMin()
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
    @store.sort[0]
  end
end

# 4) Given a list of the restaurant's’ opening time, 
# merge them if they have overlap. (Merge Interval)

def open_hours(hours)
  merged_hours = {}

  hours.each do |day, intervals|
    current = intervals[0]
    operating = []
    idx = 1

    while idx < intervals.length
      if current[1] >= intervals[idx][0]
        current = [current[0], [current[1], intervals[idx][1]].max]
      else
        operating << current
        current = intervals[idx]
      end

      idx += 1
    end

    operating << current
    merged_hours[day] = operating
  end

  merged_hours
end

input = {
  'Monday': [[100, 300], [300, 600], [600, 800]],
  'Tuesday': [[400, 1200]],
  'Wednesday': [[800, 1200], [1230, 1400], [1300, 1500]]
};

output = {
  'Monday': [[100, 800]],
  'Tuesday': [[400, 1200]],
  'Wednesday': [[800, 1200], [1230, 1500]]
};

p open_hours(input)

# 5) Mutual item with best ranking

# Input:
#   restaurants_1: ['El Farolito', 'Japa Curry', 'Eatsa']
#   restaurants_2: ['Japa Curry', 'Eatsa', 'Ayola', 'Working Girls']
# Output:
#   'Japa Curry' - least combined rank of 3. 2 in (1) and 1 in (2)

# Otherwise: 'Yelpwich'
def favorite_restaurant(r1, r2)
  res1 = {}
  res2 = {}

  short, long = r1.length > r2.length ? [r2, r1] : [r1, r2]

  (0...long.length).each do |i|
    res1[r1[i]] = i if r1[i]
    res2[r2[i]] = i if r2[i]
  end

  best_rank = nil
  best_restaurant = nil

  res1.each do |k, v|
    if res2[k]
      rank = res1[k] + v
      if !best_rank || rank < best_rank
        best_rank = rank
        best_restaurant = k
      end
    end
  end

  best_restaurant || "Yelpwich"
end

def favorite_restaurant2(r1, r2)
  seen = Hash.new { |h, k| h[k] = [] }
  long = r1.length > r2.length ? r1.length : r2.length
  (0...long).each do |i|
    seen[r1[i]] << i
    seen[r2[i]] << i
  end

  best_rank = nil
  best_restaurant = nil

  seen.each do |k, v|
    if v.length == 2
      rank = v.inject(:+)
      if !best_rank || rank < best_rank
        best_rank = rank
        best_restaurant = k
      end
    end
  end

  best_restaurant || "Yelpwich"
end

r1 = ['El Farolito', 'Japa Curry', 'Eatsa']
r2 = ['Japa Curry', 'Eatsa', 'Ayola', 'Working Girls']
r3 = ['Japa Curr', 'Etsa', 'Aola', 'Working Girl']

p favorite_restaurant2(r1, r2)
p favorite_restaurant2(r2, r3)

# 6) Input: List of strings. Output: List of list of strings with anagrams together

def group_anagrams(arr)
  hash = Hash.new { |h, k| h[k] = [] }
  arr.each do |str|
    hash[str.chars.sort] << str
  end

  hash.values.map(&:sort)
end

input6 = ["eat", "tea", "tan", "ate", "nat", "bat"]
output6 = [["ate", "eat","tea"], ["nat","tan"], ["bat"]]
p group_anagrams(input6) #== output

# 7) Given two vertices in a directed graph, find whether there is a path from one to the other.
class Vertex
  attr_accessor :val, :in_edges, :out_edges

  def initialize(val)
    @val = val
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  attr_accessor :to_vertex, :from_vertex

  def initialize(from_vertex, to_vertex)
    @to_vertex, @from_vertex = to_vertex, from_vertex
    @to_vertex.in_edges << self
    @from_vertex.out_edges << self
  end

  def destroy!
    @to_vertex.in_edges.delete(self)
    @from_vertex.out_edges.delete(self)

    @to_vertex, @from_vertex = nil, nil
  end
end

a = Vertex.new(1)
b = Vertex.new(2)
c = Vertex.new(3)
d = Vertex.new(4)
e = Vertex.new(5)
f = Vertex.new(6)
Edge.new(a, b)
Edge.new(c, a)
Edge.new(f, d)
Edge.new(e, f)
Edge.new(c, f)
Edge.new(b, e)

def path_exists?(v1, v2)
  visited = {}
  queue = [v1]

  until queue.empty?
    current = queue.shift
    return true if current == v2
    
    current.out_edges.each do |edge|
      v = edge.to_vertex
      return true if v == v2
      
      if !visited[v]
        queue << v
        visited[v] = true
      end
    end
  end

  false
end

p path_exists?(a, f) == true
p path_exists?(c, d) == true
p path_exists?(e, c) == false
p path_exists?(e, d) == true


# 10) Sort strings containing restaurant names and ratings by ratings.

def sort_by_ratings(businesses)
  businesses.sort_by { |business| business[:rating] }
            .map { |busi| busi[:name] }
end

businesses = [
  {
    "name": "Restaurant 1",
    "rating": 4.2
  },
  {
    "name": "Restaurant 2",
    "rating": 3.1
  },
  {
    "name": "Restaurant 3",
    "rating": 5
  },
  {
    "name": "Restaurant 4",
    "rating": 2.7
  },
  {
    "name": "Restaurant 5",
    "rating": 2.6
  },
  {
    "name": "Restaurant 6",
    "rating": 1.3
  }
]

p sort_by_ratings(businesses) == ["Restaurant 6", "Restaurant 5", "Restaurant 4", "Restaurant 2", "Restaurant 1", "Restaurant 3"]

string_businesses = "name: Restaurant 1, rating: 4.2; name: Restaurant 2, rating: 3.1; name: Restaurant 3, rating: 5; name: Restaurant 4, rating: 2.7; name: Restaurant 5, rating: 2.6; name: Restaurant 6, rating: 1.3;"

def sort_string(string_businesses)
  object = {}
  businesses = string_businesses.split(";").map(&:strip)
  businesses.each do |business|
    name = business.split(",")[0][6..-1]
    rating = business.split(",")[1][9..-1].to_f
    object[name] = rating
  end

  object.sort_by { |name, rating| rating }.map { |pair| pair[0] }
end

p sort_string(string_businesses) == ["Restaurant 6", "Restaurant 5", "Restaurant 4", "Restaurant 2", "Restaurant 1", "Restaurant 3"]

# 11) Given a list of businesses and their ratings, return the median. (The business with the median rating)

def find_median(arr)
  mid = arr.length / 2

  arr.sort_by { |obj| obj[:rating] }[mid][:name]
end

businesses2 = [
  {
    "name": "Restaurant 1",
    "rating": 4.2
  },
  {
    "name": "Restaurant 2",
    "rating": 3.1
  },
  {
    "name": "Restaurant 3",
    "rating": 5
  },
  {
    "name": "Restaurant 4",
    "rating": 2.7
  },
  {
    "name": "Restaurant 5",
    "rating": 2.6
  },
  {
    "name": "Restaurant 6",
    "rating": 1.3
  },
  {
    "name": "Restaurant 7",
    "rating": 1.9
  }
]

p find_median(businesses2) == "Restaurant 4"

# Do this in O(log N) => MinHeap && MaxHeap
class MedianFinder
  attr_accessor :high, :low

  def initialize
    @high = BinaryMinHeap.new(Proc.new { |a, b| a <=> b }) # Min Heap
    @low = BinaryMinHeap.new(Proc.new { |a, b| b <=> a }) # Max Heap
  end

  def insert(num)
    @low.push(num)
    @high.push(@low.peek)
    @low.extract

    if @low.count < @high.count
      @low.push(@high.peek)
      @high.extract
    end
  end

  def find_median
    if (@low.count + @high.count) % 2 == 1
      @low.peek
    else
      (@low.peek + @high.peek) / 2
    end
  end
end

# Implement MinHeap

class BinaryMinHeap
  attr_accessor :prc, :store

  def initialize(prc)
    @store = []
    @prc = prc
  end

  def peek
    @store[0]
  end

  def count
    @store.length
  end

  def self.child_indices(parent_idx, len)
    children = [parent_idx * 2 + 1, parent_idx * 2 + 2]
    children.select { |idx| idx < len }
  end

  def self.parent_index(child_idx)
    raise "no parent" if (child_idx - 1) / 2 < 0
    (child_idx - 1) / 2
  end

  def self.heapify_up(array, child_idx, prc)
    prc ||= Proc.new { |a, b| a <=> b }
    return array if child_idx == 0
    parent = parent_index(child_idx)

    if prc.call(array[parent], array[child_idx]) >= 0
      array[parent], array[child_idx] = array[child_idx], array[parent]
      heapify_up(array, parent, prc)
    end

    array
  end

  def self.heapify_down(array, parent_idx, prc)
    prc ||= Proc.new { |a, b| a <=> b }
    children = child_indices(parent_idx, array.length)

    if children.length == 2
      children = prc.call(array[children[0]], array[children[1]]) < 1 ? children[0] : children[1]
    elsif children.length == 1
      children = children[0]
    else
      return array
    end

    if prc.call(array[children], array[parent_idx]) < 1
      array[children], array[parent_idx] = array[parent_idx], array[children]
      heapify_down(array, children, prc)
    end

    array
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(@store, count - 1, @prc)
  end

  def extract
    @store[0], @store[count - 1] = @store[count - 1], @store[0]
    extracted = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, @prc)
    extracted
  end
end


array = [2, 3, 4]
array2 = [4, 8, 9, 6]

median = MedianFinder.new
median.insert(2)
median.insert(3)
median.insert(4)
p median.find_median

median2 = MedianFinder.new
median2.insert(4)
median2.insert(8)
median2.insert(9)
median2.insert(6)
p median2.find_median

# 13) Given the length and width of a board, also given a number n, generate a board that randomly contains n mines in this board. (OOP)

class Board
  attr_accessor :grid

  def initialize(l, w, n)
    @grid = blank_board(l, w)
    @mines = random_mines(l, w, n)
    place_mines(@grid, @mines)
  end

  def blank_board(l, w)
    Array.new(l) { Array.new(w, false) }
  end

  def random_mines(l, w, n)
    already_generated = {}
    mines = []

    n.times do
      pos = [rand(l), rand(w)]

      while already_generated[pos]
        pos = [rand(l), rand(w)]
      end

      mines << pos
    end

    mines
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def place_mines(grid, mines)
    mines.each do |pos|
      self[pos] = true
    end
  end

  def display_board
    @grid.each do |row|
      p row
    end
  end
end

board = Board.new(5, 10, 10)
board.display_board

# 14) Color sort: Given a collection of different colors, return the sorted collection of colors based on the frequency.
colors = ["red", "orange", "red", "yellow", "green", "blue", "blue", "purple", "white", "black", "black", "black", "white", "red", "green", "pink"]

def color_sort(colors)
  frequency = Hash.new(0)

  colors.each do |color|
    frequency[color] += 1
  end

  frequency.sort_by { |k, v| v }.map { |pair| pair[0] }
end

p color_sort(colors)

# 15) Given N words, decide if all words are anagrams of each other. (“cat”, “act”, “tac” => true)
def anagrams(words)
  sorted = words[0].split("").sort.join("")
  words.all? { |word| word.split("").sort.join("") == sorted }
end

words = ["cat", "act", "tac"]
p anagrams(words)

# 17) Given a string of words, reverse the words (“I like cats” => “cats like I”)
def reverse_words(str)
  str.split(" ").reverse.join(" ")
end

# 18) Given a string, how would you check if the string is a palindrome?

def is_palindrome?(str)
  low = 0
  high = str.length - 1

  while low < high
    return false if str[low] != str[high]
    low += 1
    high -= 1
  end

  true
end

p is_palindrome?("aaaaabaaaaa")
p is_palindrome?("aaaaaabaaaa")
p is_palindrome?("aaaaaabbaaaaaa")

# 19) Return all words in the list with the prefix that user searched for and without traversing the list every time.

class Trie

end








