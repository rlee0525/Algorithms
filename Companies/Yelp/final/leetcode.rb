# 1) Leetcode - 2Sum (1)
def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |num, idx|
    return [hash[num], idx] if hash[num]
    hash[target - num] = idx
  end
end


# 2) Leetcode - Longest Substring Without Repeating Characters (3)
def length_of_longest_substring(s)
  seen = {}
  longest = 0
  start_idx = 0

  s.chars.each_with_index do |char, idx|
    if seen[char] && start_idx <= seen[char]
      start_idx = seen[char] + 1
    else
      longest = [longest, idx - start_idx + 1].max
    end

    seen[char] = idx
  end

  longest
end


# 3) Leetcode - Longest Common Prefix (14)
def longest_common_prefix(strs)
  prefix = ""
  return prefix if strs.empty?
  current = strs[0]

  (0...current.length).each do |i|
    (1...strs.length).each do |j|
      return prefix if !strs[j][i] || strs[j][i] != current[i]
    end

    prefix += current[i]
  end

  prefix
end
  

# 4) Leetcode - 3Sum (15)
def three_sum(nums)
  nums.sort!
  res = []

  (0...nums.length - 2).each do |i|
    if i == 0 || nums[i] != nums[i - 1]
      low = i + 1
      high = nums.length - 1

      while low < high
        if nums[i] + nums[low] + nums[high] == 0
          res << [nums[i], nums[low], nums[high]]
          low += 1
          high -= 1

          low += 1 while nums[low] == nums[low - 1]
          high -= 1 while nums[high] == nums[high + 1]
        elsif nums[i] + nums[low] + nums[high] > 0
          high -= 1
        else
          low += 1
        end
      end
    end
  end

  res
end


# 5) Leetcode - 4Sum (18)
def four_sum(nums, target)
  nums.sort!
  res = []

  (0...nums.length - 3).each do |i|
    if i == 0 || nums[i] != nums[i - 1]
      (i + 1...nums.length - 2).each do |j|
        if j == i + 1 || nums[j] != nums[j - 1]
          low = j + 1
          high = nums.length - 1

          while low < high
            if nums[i] + nums[j] + nums[low] + nums[high] == target
              res << [nums[i], nums[j], nums[low], nums[high]]
              low += 1
              high -= 1

              low += 1 while nums[low] == nums[low - 1]
              high -= 1 while nums[high] == nums[high + 1]
            elsif nums[i] + nums[j] + nums[low] + nums[high] > target
              high -= 1
            else
              low += 1
            end
          end
        end
      end
    end
  end
  
  res
end


# 6) Leetcode - Group Anagrams (49)
def group_anagrams(strs)
  groups = Hash.new { |h, k| h[k] = [] }

  strs.each do |str|
    groups[str.chars.sort.join("")] << str
  end

  groups.values
end


# 7) Leetcode - Merge Intervals (56)
class Interval
  attr_accessor :start, :end
  
  def initialize(start_val, end_val)
    @start = start_val
    @end = end_val
  end
end

def merge(intervals)
  merged = []
  return merged if intervals.empty?
  intervals = intervals.sort_by { |interval| interval.start }
  current = intervals[0]

  (1...intervals.length).each do |i|
    if current.end >= intervals[i].start
      current = Interval.new(current.start, [current.end, intervals[i].end].max)
    else
      merged << current
      current = intervals[i]
    end
  end

  merged << current
  merged
end


# 8) Leetcode - Binary Tree Inorder Traversal (94)
# left -> root -> right
def inorder_traversal_rec(root)
  res = []
  inorder_dfs(root, res)
  res
end

def inorder_dfs(root, res)
  return root unless root

  inorder_dfs(root.left, res)
  res << root.val
  inorder_dfs(root.right, res)
end

def inorder_traversal_iter(root)
  res, stack = [], []

  while stack.length != 0 || root
    if root
      stack << root
      root = root.left
    else
      node = stack.pop
      res << node.val
      root = node.right
    end
  end

  res
end
      

# 9) Leetcode - Validate Binary Search Tree (98)
def is_valid_bst(root, min_val = -1.0 / 0.0, max_val = 1.0 / 0.0)
  return true unless root
  return false if root.val <= min_val || root.val >= max_val

  is_valid_bst(root.left, min_val, root.val) && is_valid_bst(root.right, root.val, max_val)
end


# 10) Leetcode - Binary Tree Level Order Traversal (102)
def level_order(root)
  ordered = []
  return ordered unless root
  queue = [[root]]

  until queue.empty?
    current = queue.shift
    same_level = []
    vals = []

    current.each do |node|
      same_level << node.left if node.left
      same_level << node.right if node.right
      vals << node.val
    end

    queue << same_level unless same_level.empty?
    ordered << vals
  end

  ordered
end


# 11) Leetcode - Binary Tree Zigzag Level Order Traversal (103)
def zigzag_level_order(root)
  zigzagged = []
  return zigzagged unless root
  queue = [[root]]
  zigzag = false

  until queue.empty?
    current = queue.shift
    same_level = []
    vals = []

    current.each do |node|
      same_level << node.left if node.left
      same_level << node.right if node.right

      if zigzag
        vals = [node.val] + vals
      else
        vals << node.val
      end
    end

    queue << same_level unless same_level.empty?
    zigzagged << vals
    zigzag = !zigzag
  end

  zigzagged
end


# 12) Leetcode - Maximum Depth of Binary Tree (104)
def max_depth(root)
  return 0 unless root

  1 + [max_depth(root.left), max_depth(root.right)].max
end


# 13) Leetcode - Construct Binary Tree from Preorder and Inorder Traversal (105)
# root -> left -> right
# left -> root -> right
def build_tree_rec(preorder, inorder)
  unless inorder.empty?
    original = preorder.shift
    ind = inorder.index(original)
    root = TreeNode.new(inorder[ind])
    root.left = build_tree_rec(preorder, inorder[0...ind])
    root.right = build_tree_rec(preorder, inorder[ind + 1..-1])
    root
  end
end

def build_tree_iter(preorder, inorder)
  return if inorder.empty?
  root = TreeNode.new(preorder[0])
  stack = [root]
  pidx, iidx = 1, 0

  # iterate through preorder
  while pidx < preorder.length
    parent_node = nil
    current = TreeNode.new(preorder[pidx])

    # if last value in stack is the same as inorder, we've reached the point
    # where there's no more left.
    while !stack.empty? && stack[-1].val == inorder[iidx]
      parent_node = stack.pop
      iidx += 1
    end

    # set parent node's right to current if parent_node
    # otherwise keep building left
    if parent_node
      parent_node.right = current
    else
      stack[-1].left = current
    end

    stack << current
    pidx += 1
  end

  root
end


# 14) Leetcode - Construct Binary Tree from Inorder and Postorder Traversal (106)
# left -> root -> right
# left -> right -> root
def build_tree_rec(inorder, postorder)
  unless inorder.empty?
    original = postorder.pop
    ind = inorder.index(original)
    root = TreeNode.new(inorder[ind])
    root.right = build_tree_rec(inorder[ind + 1..-1], postorder)
    root.left = build_tree_rec(inorder[0...ind], postorder)
    root
  end
end

def build_tree_iter(inorder, postorder)
  return if inorder.empty?
  root = TreeNode.new(postorder[-1])
  stack = [root]
  pidx, iidx = postorder.length - 2, inorder.length - 1

  while pidx >= 0
    parent = nil
    current = TreeNode.new(postorder[pidx])

    while !stack.empty? && stack[-1].val == inorder[iidx]
      parent = stack.pop
      iidx -= 1
    end

    if parent
      parent.left = current
    else
      stack[-1].right = current
    end

    stack << current
    pidx -= 1
  end

  root
end


# 15) Leetcode - Binary Tree Level Order Traversal II (107)
def level_order_bottom(root)
  ordered = []
  return ordered unless root
  queue = [[root]]

  until queue.empty?
    current = queue.shift
    same_level = []
    vals = []

    current.each do |node|
      same_level << node.left if node.left
      same_level << node.right if node.right
      vals << node.val
    end

    queue << same_level unless same_level.empty?
    ordered = [vals] + ordered
  end

  ordered
end

# 16) Leetcode - Word Ladder II (126)
def find_ladders(begin_word, end_word, word_list)
  word_list = create_dictionary(word_list)
  queue = [[begin_word, 1, {}, [begin_word]]]
  paths = []
  min_count = nil

  until queue.empty?
    current = queue.shift
    word, count, visited, path = current

    (0...word.length).each do |i|
      sliced = word[0...i] + "_" + word[i + 1..-1]

      word_list[sliced].each do |w|
        current_visited = visited.dup
        current_path = path.dup

        if !current_visited[w]
          current_visited[w] = true
          current_path << w
          queue << [w, count + 1, current_visited, current_path]

          if w == end_word && !min_count
            min_count = count + 1
            paths << current_path
          elsif w == end_word && min_count == count + 1
            paths << current_path
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


# 17) Leetcode - Word Ladder (127)
# def ladder_length(begin_word, end_word, word_list)
#   queue = [begin_word]
#   visited = {}
#   count = 1

#   until queue.empty?
#     current = queue.shift

#     if current.is_a? Array
#       count = current[1]
#       current = current[0]
#     end

#     word_list.each do |word|
#       if !visited[word] && one_letter_away(current, word)
#         queue << [word, count + 1]
#         visited[word] = true

#         return count + 1 if word == end_word
#       end
#     end
#   end

#   0
# end

# def one_letter_away(word1, word2)
#   difference = (word1.length - word2.length).abs
#   return false if difference > 1
#   shorter = word1.length > word2.length ? word2 : word1

#   (0...shorter.length).each do |i|
#     difference += 1 if word1[i] != word2[i]
#     return false if difference > 1
#   end

#   true
# end

def ladder_length(begin_word, end_word, word_list)
  word_list = create_dictionary(word_list)
  queue = [[begin_word, 1]]
  visited = {}

  until queue.empty?
    current = queue.shift
    word, count = current

    (0...word.length).each do |i|
      sliced = word[0...i] + "_" + word[i + 1..-1]

      word_list[sliced].each do |w|
        if !visited[w]
          queue << [w, count + 1]
          visited[w] = true

          return count + 1 if w == end_word
        end
      end
    end
  end

  0
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


# 18) Leetcode - Binary Tree Preorder Traversal (144)
# root -> left -> right
def preorder_traversal_rec(root)
  res = []
  preorder_dfs(root, res)
  res
end

def preorder_dfs(root, res)
  return root unless root

  res << root.val
  preorder_dfs(root.left, res)
  preorder_dfs(root.right, res)
end

def preorder_traversal_iter(root)
  res, stack = [], []

  while stack.length != 0 || root
    if root
      stack << root
      res << root.val
      root = root.left
    else
      node = stack.pop
      root = node.right
    end
  end

  res
end


# 19) Leetcode - Binary Tree Postorder Traversal (145)
def postorder_traversal_rec(root)
  res = []
  postorder_dfs(root, res)
  res
end

def postorder_dfs(root, res)
  return root unless root

  postorder_dfs(root.left, res)
  postorder_dfs(root.right, res)
  res << root.val
end

def postorder_traversal_iter(root)
  res, stack = [], []

  while !stack.empty? || root
    if root
      res = [root.val] + res
      stack << root
      root = root.right
    else
      node = stack.pop
      root = node.left
    end
  end

  res
end


# 20) Leetcode - Reverse Words in a String (151)
def reverse_words(str)
  str.strip.split(/\s+/).reverse.join(" ")
end


# 21) Leetcode - Isomorphic Strings (205)
def is_isomorphic(s1, s2)
  return false if s1.length != s2.length

  pairs = {}
  seen_2 = {}

  (0...s1.length).each do |i|
    c1 = s1[i]
    c2 = s2[i]

    if seen_2[c2] || pairs[c1]
      return false if pairs[c1] != c2
    end

    seen_2[c2] = true
    pairs[c1] = c2
  end

  true
end


# 22) Leetcode - Reverse Linked List (206) - (BFS && DFS)
def reverse_list_rec(head, prev = nil)
  return prev unless head
  
  current = head
  head = head.next
  current.next = prev
  reverse_list_rec(head, current)
end

def reverse_list_iter(head)
  prev = nil

  while head
    current = head
    head = head.next
    current.next = prev
    prev = current
  end

  prev
end


# 23) Leetcode - Course Schedule (207) - (BFS && DFS)
def can_finish(num_courses, prerequisites)
  in_edges_count = Hash.new(0)
  out_edges = Hash.new { |h, k| h[k] = [] }

  prerequisites.each do |pair|
    in_edges_count[pair[0]] += 0
    in_edges_count[pair[1]] += 1
    out_edges[pair[0]] << pair[1]
    out_edges[pair[1]] = [] unless out_edges[pair[1]]
  end

  queue = []
  in_edges_count.each do |k, v|
    queue << k if v == 0
  end

  until queue.empty?
    current = queue.shift
    neighbors = out_edges[current]

    neighbors.each do |neighbor|
      in_edges_count[neighbor] -= 1
      queue << neighbor if in_edges_count[neighbor] == 0
    end
  end

  in_edges_count.all? { |k, v| v == 0 }
end


# 24) Leetcode - Implement Trie (208)
class TrieNode
  attr_accessor :children, :is_word

  def initialize
    @children = {}
    @is_word = false
  end
end

class Trie
  attr_accessor :root

  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    current = @root

    word.each_char do |char|
      if !current.children[char]
        current.children[char] = TrieNode.new
      end

      current = current.children[char]
    end

    current.is_word = true
  end

  def search(word)
    current = @root

    word.each_char do |char|
      return false unless current.children[char]
      current = current.children[char]
    end

    current.is_word
  end

  def starts_with(prefix)
    current = @root

    prefix.each_char do |char|
      return false unless current.children[char]
      current = current.children[char]
    end

    true
  end
end


# 25) Leetcode - The Skyline Problem (218)
class BinaryMaxHeap
  attr_accessor :store, :prc
  
  def initialize(&prc)
    @store = []
  end

  def peek
    @store[0]
  end

  def count
    @store.length
  end

  def self.child_indices(parent_idx, length)
    children = [parent_idx * 2 + 1, parent_idx * 2 + 2]
    children.select { |idx| idx < length - 1 }
  end

  def self.parent_index(child_idx)
    raise "no parent" if (child_idx - 1) / 2 < 0
    (child_idx - 1) / 2
  end

  def self.heapify_up(array, child, &prc)
    return array if child == 0
    prc ||= Proc.new { |a, b| b <=> a }
    parent = parent_index(child)

    if prc.call(array[child][0], array[parent][0]) < 1
      array[child], array[parent] = array[parent], array[child]
      heapify_up(array, parent, &prc)
    end

    array
  end

  def self.heapify_down(array, parent, &prc)
    prc = Proc.new { |a, b| b <=> a }
    children = child_indices(parent, array.length)

    if children.length == 2
      child = prc.call(array[children[0]][0], array[children[1]][0]) < 1 ? children[0] : children[1]
    elsif children.length == 1
      child = children[0]
    else
      return array
    end

    if prc.call(array[child][0], array[parent][0]) < 1
      array[child], array[parent] = array[parent], array[child]
      heapify_down(array, child, &prc)
    end

    array
  end

  def push(val)
    @store << val
    BinaryMaxHeap.heapify_up(@store, count - 1, &prc)
  end

  def extract
    @store[0], @store[count - 1] = @store[count - 1], @store[0]
    extracted = @store.pop
    BinaryMaxHeap.heapify_down(@store, 0, &prc)
    extracted
  end
end

def get_skyline(buildings)
  skyline = []
  queue = BinaryMaxHeap.new
  i = 0
  n = buildings.length

  while i < n || queue.count != 0
    if queue.count == 0 || (i < n && buildings[i][0] <= queue.peek[1])
      x = buildings[i][0]

      while i < n && buildings[i][0] == x
        queue.push([buildings[i][2], buildings[i][1]])
        i += 1
      end
    else
      x = queue.peek[1]

      while queue.count != 0 && queue.peek[1] <= x
        queue.extract
      end
    end

    height = queue.count == 0 ? 0 : queue.peek[0]

    if skyline.empty? || skyline[-1][1] != height
      skyline << [x, height]
    end
  end

  skyline
end


# 26) Leetcode - Invert Binary Tree (226)
def invert_tree(root)
  return root unless root

  temp = root.left
  root.left = invert_tree(root.right)
  root.right = invert_tree(temp)

  root
end


# 27) Leetcode - Valid Anagram (242)
def is_anagram(s, t)
  return false if s.length != t.length
  hash = Hash.new(0)

  (0...s.length).each do |i|
    hash[s[i]] += 1
    hash[t[i]] -= 1
  end

  hash.all? { |k, v| v == 0 }
end

