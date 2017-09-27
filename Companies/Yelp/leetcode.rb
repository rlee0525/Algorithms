def two_sum(nums, target)
  seen = {}

  nums.each_with_index do |num, idx|
    return [seen[num], idx] if seen[num]

    seen[target - num] = idx
  end
end

def three_sum(nums)
  nums.sort!
  set = []

  (0...nums.length - 2).each do |idx|
    if idx == 0 || nums[idx] != nums[idx - 1]
      low = idx + 1
      high = nums.length - 1

      while low < high
        if nums[idx] + nums[low] + nums[high] == 0
          set << [nums[idx], nums[low], nums[high]]
          low += 1
          high -= 1

          low += 1 while nums[low] == nums[low - 1]
          high -= 1 while nums[high] == nums[high + 1]
        elsif nums[idx] + nums[low] + nums[high] > 0
          high -= 1
        else
          low += 1
        end
      end
    end
  end

  set
end

def four_sum(nums, target)
  nums.sort!
  set = []

  (0...nums.length - 3).each do |idx|
    if (idx == 0 || nums[idx] != nums[idx - 1])
      (idx + 1...nums.length - 2).each do |idx2|
        if (idx2 == idx + 1 || nums[idx2] != nums[idx2 - 1])
          low = idx2 + 1
          high = nums.length - 1

          while low < high
            sum_num = nums[idx] + nums[idx2] + nums[low] + nums[high]
            
            if sum_num == target
              set << [nums[idx], nums[idx2], nums[low], nums[high]]
              low += 1
              high -= 1

              low += 1 while nums[low] == nums[low - 1]
              high -= 1 while nums[high] == nums[high + 1]
            elsif sum_num > target
              high -= 1
            else
              low += 1
            end
          end
        end
      end
    end
  end

  set
end

def length_of_longest_substring(s)
  seen = {}
  start_idx = 0
  length = 0

  s.chars.each_with_index do |char, i|
    if (seen[char] && start_idx <= seen[char])
      start_idx = seen[char] + 1
    else
      length = [length, i - start_idx + 1].max
    end

    seen[char] = i
  end

  length
end

def longest_common_prefix(strs)
  prefix = ""
  return prefix if strs.empty?

  (0...strs[0].length).each do |i|
    (1...strs.length).each do |j|
      return prefix if strs[j][i] != strs[0][i]
    end

    prefix += strs[0][i]
  end

  prefix
end

def group_anagrams(strs)
  anagrams = Hash.new { |h, k| h[k] = [] }

  strs.each do |str|
    anagrams[str.split("").sort.join] << str
  end

  anagrams.values
end

def merge(intervals)
  merged = []
  
  return merged if intervals.empty?

  intervals.sort_by! { |interval| interval.start }
  current = intervals[0]

  (1...intervals.length).each do |i|
    if (current.end >= intervals[i].start)
      current = Interval.new(current.start, [current.end, intervals[i].end].max)
    else
      merged << current
      current = intervals[i]
    end
  end

  merged << current
  merged
end

def find_ladders(begin_word, end_word, word_list)
  word_list = create_dictionary(word_list)
  queue = [[begin_word, 1, {}, [begin_word]]]
  min_count = nil
  paths = []

  until queue.empty?
    current = queue.shift
    word = current[0]
    count = current[1]
    visited = current[2]
    path = current[3]

    (0...word.length).each do |i|
      sliced = word[0...i] + "_" + word[i + 1..-1]
      neighbors = word_list[sliced]

      neighbors.each do |neighbor|
        current_visited = visited.dup
        current_path = path.dup

        if !current_visited[neighbor]
          current_visited[neighbor] = true
          current_path.push(neighbor)

          if !min_count && neighbor == end_word
            min_count = count + 1
            paths << current_path
          elsif neighbor == end_word && min_count == count + 1
            paths << current_path
          else
            queue.push([neighbor, count + 1, current_visited, current_path])
          end
        end
      end
    end
  end

  paths
end

def create_dictionary(word_list)
  dictionary = Hash.new { |h, k| h[k] = [] }

  word_list.each do |word|
    (0...word.length).each do |i|
      sliced = word[0...i] + "_" + word[i + 1..-1]
      dictionary[sliced] << word
    end
  end

  dictionary
end

def ladder_length(begin_word, end_word, word_list)
  visited = {}
  queue = [begin_word]
  count = 1

  until queue.empty? || count >= word_list.length
    current = queue.shift

    if (current.is_a?(Array))
      count = current[1]
      current = current[0]
    end

    (0...word_list.length).each do |i|
      word = word_list[i]

      if (!visited[word] && one_letter_away(current, word))
        queue << [word, count + 1]

        return count + 1 if word == end_word
      end
    end
  end

  0
end

def one_letter_away(word1, word2)
  return false if word1.length != word2.length

  difference = (word1.length - word2.length).abs

  (0...word1.length).each do |i|
    difference += 1 if word1[i] != word2[i]
    return false if difference > 1
  end

  true
end

def reverse_words(str)
  str.strip.split(/\s+/).reverse.join(" ")
end

p reverse_words("       hello    world !   wh    ")

def is_isomorphic(s1, s2)
  return false if s1.length != s2.length

  seen_pairs = {}
  seen_s2 = {}

  (0...s1.length).each do |i|
    return false if seen_pairs[s1[i]] && seen_pairs[s1[i]] != s2[i]
    return false if !seen_pairs[s1[i]] && seen_s2[s2[i]]

    seen_pairs[s1[i]] = s2[i]
    seen_s2[s2[i]] = true
  end

  true
end

def reverse_list(head)
  prev = nil

  while head
    current = head
    head = head.next
    current.next = prev
    prev = current
  end

  prev
end

def can_finish(num_courses, prerequisites)
  in_edges_count = Hash.new(0)
  out_edges = Hash.new { |h, k| h[k] = [] }

  prerequisites.each do |pair|
    out_edges[pair[0]] << pair[1]

    in_edges_count[pair[1]] += 1
    in_edges_count[pair[0]] += 0
  end

  queue = []

  in_edges_count.each do |k, v|
    queue << k if v == 0
  end

  until queue.empty?
    current = queue.shift

    out_edges[current].each do |edge|
      in_edges_count[edge] -= 1
      queue << edge if in_edges_count[edge] == 0
    end
  end

  in_edges_count.all? { |k, v| v == 0 }
end

def get_skyline(buildings)

end

class BinaryHeaps
  attr_accessor :store, :prc

  def initialize(prc = Proc.new { |a, b| a <=> b })
    @store = []
    @prc = prc
  end

  def peek
    @store[0]
  end

  def count
    @store.length
  end

  def self.child_indices(parent_idx, length = count)
    children = [parent_idx * 2 + 1, parent_idx * 2 + 2]
    children.select { |child| child < length }
  end

  def self.parent_index(child_idx, length = count)
    raise "no parent" if (child_idx - 1) / 2 < 0
    (child_idx - 1) / 2
  end

  def self.heapify_up(array, child_idx, prc)
    return array if child_idx == 0
    parent = parent_index(child_idx, array.length)
    
    if prc.call(array[parent][0], array[child_idx][0]) >= 0
      array[parent], array[child_idx] = array[child_idx], array[parent]
      heapify_up(array, parent, prc)
    end
    
    array
  end

  def self.heapify_down(array, parent_idx, prc)
    children = child_indices(parent_idx, array.length)

    if children.length == 2
      children = prc.call(array[children[0]][0], array[children[1]][0]) < 1 ? children[0] : children[1]
    elsif children.length == 1
      children = children[0]
    else
      return array
    end

    if prc.call(array[parent_idx][0], array[children][0]) >= 0
      array[parent_idx], array[children] = array[children], array[parent_idx]
      heapify_down(array, children, prc)
    end

    array
  end

  def push(val)
    @store << val
    BinaryHeaps.heapify_up(@store, count - 1, @prc)
  end

  def extract
    @store[0], @store[count - 1] = @store[count - 1], @store[0]
    extracted = @store.pop
    BinaryHeaps.heapify_down(@store, 0, @prc)
    extracted
  end
end

def get_skyline(buildings)
  skyline = []
  i = 0
  n = buildings.length
  # Build Max Heaps sorted by height
  queue = BinaryHeaps.new(Proc.new { |a, b| b <=> a })

  while i < n || queue.count != 0
    # check left x coord of buildings and x coord of seen buildings
    
    # starting point of the building is smaller than the right side of queue
    if queue.count == 0 || (i < n && buildings[i][0] <= queue.peek[1])
      # x coord (smaller input - buildings)
      x = buildings[i][0]
     
      # add all the builings that start at that x coord to the queue - building appears before the queued buildings
      while i < n && buildings[i][0] == x
        queue.push([buildings[i][2], buildings[i][1]])
        i += 1
      end
    
    # starting point of the building is bigger than the right side of queue. => building on the queue appears first
    else
      # x coordinate (smaller input - queue)
      x = queue.peek[1]

      # remove all queued buildings ending at that x or earlier. (also it's the tallest building in the queue)
      while queue.count != 0 && queue.peek[1] <= x
        queue.extract
      end
    end

    # determine current height from queue
    height = queue.count != 0 ? queue.peek[0] : 0

    # add to skyline (x, y)
    if skyline.empty? || height != skyline[-1][1]
      skyline << [x, height]
    end
  end

  skyline
end

def invert_tree(root)
  return nil unless root

  temp = root.left
  root.left = invert_tree(root.right)
  root.right = invert_tree(temp)

  root
end

def is_anagram(s, t)
  return false if s.length != t.length

  count = Hash.new(0)

  (0...s.length).each do |i|
    count[s[i]] += 1
    count[t[i]] -= 1
  end

  count.all? { |k, v| v == 0 }
end

# WordLadder - Optimized
# https://discuss.leetcode.com/topic/43246/simple-to-understand-python-solution-using-list-preprocessing-and-bfs-beats-95/4
# def ladder_length(begin_word, end_word, word_list)
#   # Modified version of word_list
#   word_list = construct_dictionary(word_list)
  
#   # Same format. [word, count]
#   queue = [[begin_word, 1]]
#     visited = {}

#     # Typical BFS
#     until queue.empty?
#       word, steps = queue.shift
      
#       # Only if the word hasn't been visited
#       unless visited[word]
#         visited[word] = true
#         # Return step if the word no longer requires transformation
#         return steps if word == end_word

#         # Go through each characters in the word
#         (0...word.length).each do |idx|
#           # Match keys in the dictionary
#           string = word[0...idx] + "_" + word[idx + 1..-1]
#           # Find all words that are one letter away
#           neighbors = word_list[string]

#           # Go through all possible one letter away words
#           neighbors.each do |neighbor|
#             # If it hasn't been visited, enqueue it ... Unnecessary in BFS.
#             unless visited[neighbor]
#               queue.push([neighbor, steps + 1])
#             end
#           end
#         end
#       end
#     end

#     return 0
# end

def ladder_length(begin_word, end_word, word_list)
  word_list = construct_dictionary(word_list)
  visited = {}
  queue = [[begin_word, 1]]

  until queue.empty?
    word, count = queue.shift

    (0...word.length).each do |idx|
      string = word[0...idx] + "_" + word[idx + 1..-1]
      neighbors = word_list[string]

      neighbors.each do |neighbor|
        if !visited[neighbor]
          return count + 1 if neighbor == end_word

          queue << [neighbor, count + 1]
          visited[neighbor] = true
        end
      end
    end
  end

  0
end

# instead of nesting check method, modify word_list first in terms of one charater away
def construct_dictionary(word_list)
  dictionary = Hash.new { |h, k| h[k] = [] }
  
  word_list.each do |word|
    (0...word.length).each do |idx|
      string = word[0...idx] + "_" + word[idx + 1..-1]
      dictionary[string] << word
    end
  end

  dictionary
end









