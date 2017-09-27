# 1) 2 Sum 
def two_sum(nums, target)
  seen = {}

  nums.each_with_index do |num, idx|
    return [seen[num], idx] if seen[num]

    seen[target - num] = idx    
  end
end

#2) Longest Substring Without Repeating Characters
def length_of_longest_substring(s)
  seen = {}
  start_idx = 0
  longest_length = 0

  (0...s.length).each do |idx|
    char = s[idx]

    if seen[char] && start_idx <= seen[char]
      start_idx = seen[char] + 1
    else
      longest_length = [longest_length, idx - start_idx + 1].max
    end

    seen[char] = idx
  end

  longest_length
end

# 3) Longest Common Prefix
def longest_common_prefix(strs)
  prefix = ""
  return prefix if strs.empty?

  (0...strs[0].length).each do |i|
    (1...strs.length).each do |j|
      return prefix if !strs[j][i] || strs[j][i] != strs[0][i]
    end

    prefix += strs[0][i]
  end

  prefix
end

#4) 3 Sum
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

#5) 4 Sum
def four_sum(nums, target)
  nums.sort!
  set = []

  (0...nums.length - 3).each do |i|
    if i == 0 || nums[i] != nums[i - 1]
      (i + 1...nums.length - 2).each do |j|
        if j == i + 1 || nums[j] != nums[j - 1]
          low = j + 1
          high = nums.length - 1

          while low < high
            if nums[i] + nums[j] + nums[low] + nums[high] == target
              set << [nums[i], nums[j], nums[low], nums[high]]
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

  set
end

# 6) Group Anagrams
def group_anagrams(strs)
  groups = Hash.new { |h, k| h[k] = [] }

  strs.each do |str|
    groups[str.chars.sort.join("")] << str
  end

  groups.values
end

# 7) Merge Intervals
def merge(intervals)
  intervals = intervals.sort_by { |interval| interval.start }
  merged = []
  return merged if intervals.empty?

  current = intervals[0]
  (1...intervals.length).each do |idx|
    interval = intervals[idx]

    if current.end >= interval.start
      current = Interval.new(current.start, [current.end, interval.end].max)
    else
      merged << current
      current = interval
    end
  end

  merged << current
  merged
end

# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# 8) Binary Tree Inorder Traversal
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
      current = stack.pop
      res << current.val
      root = current.right
    end
  end

  res
end

# 9) Validate Binary Search Tree
def is_valid_bst(root, max_val = 1.0 / 0.0, min_val = -1.0 / 0.0)
  return true unless root
  return false if root.val >= max_val || root.val <= min_val

  is_valid_bst(root.left, root.val, min_val) && is_valid_bst(root.right, max_val, root.val)
end

# 10) Binary Tree Level Order Traversal
# root -> left -> right
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

    ordered << vals
    queue << same_level unless same_level.empty?
  end

  ordered
end

# 11) Binary Tree Zigzag Level Order Traversal
def zigzag_level_order(root)
  ordered = []
  return ordered unless root
  queue = [[root]]
  zigzagged = false

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
    ordered << (zigzagged ? vals.reverse : vals)
    zigzagged = !zigzagged
  end

  ordered
end

# 12) Maximum Depth of Binary Tree
def max_depth(root)
  return 0 unless root

  1 + [max_depth(root.left), max_depth(root.right)].max
end

# 13) Construct Binary Tree from Preorder and Inorder Traversal
# preorder: root -> left -> right
# inorder: left -> root -> right
def build_tree_rec(preorder, inorder)
  if inorder.length != 0
    original = preorder.shift
    ind = inorder.index(original)
    root = TreeNode.new(inorder[ind])
    root.left = build_tree(preorder, inorder[0...ind])
    root.right = build_tree(preorder, inorder[ind + 1..-1])
    root
  end
end

def build_tree_iter(preorder, inorder)
  return if inorder.empty?
  root = TreeNode.new(preorder[0])
  stack = [root]
  preorder_idx = 1
  inorder_idx = 0

  while preorder_idx < preorder.length
    parent_node = nil
    current = TreeNode.new(preorder[preorder_idx])

    while !stack.empty? && stack[-1].val == inorder[inorder_idx]
      parent_node = stack.pop
      inorder_idx += 1
    end

    if parent_node
      parent_node.right = current
    else
      stack[-1].left = current
    end

    stack << current
    preorder_idx += 1
  end

  root
end

# 14) Construct Binary Tree from Inorder and Postorder Traversal
def build_tree_rec(inorder, postorder)
  if inorder.length != 0
    original = postorder.pop
    ind = inorder.index(original)
    root = TreeNode.new(inorder[ind])
    root.right = build_tree(inorder[ind + 1..-1], postorder)
    root.left = build_tree(inorder[0...ind], postorder)
    root
  end
end

def build_tree_iter(inorder, postorder)
  return if inorder.length == 0
  root = TreeNode.new(postorder[-1])
  stack = [root]
  postorder_idx = postorder.length - 2
  inorder_idx = inorder.length - 1

  while postorder_idx >= 0
    parent_node = nil
    current = TreeNode.new(postorder[postorder_idx])

    while !stack.empty? && stack[-1].val == inorder[inorder_idx]
      parent_node = stack.pop
      inorder_idx -= 1
    end

    if parent_node
      parent_node.left = current
    else
      stack[-1].right = current
    end

    stack << current
    postorder_idx -= 1
  end

  root
end

# 15) Binary Tree Level Order Traversal II
def level_order_bottom(root)
  return [] unless root
  
  ordered = nil
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

    ordered = ordered ? ([vals] + ordered) : [vals]
    queue << same_level unless same_level.empty?
  end

  ordered
end

# 16) Word Ladder II
def find_ladders(begin_word, end_word, word_list)
  word_list = create_dictionary(word_list)
  queue = [[begin_word, 1, {}, [begin_word]]]
  paths = []
  min_count = nil
  
  until queue.empty?
    word, count, visited, path = queue.shift

    (0...word.length).each do |idx|
      sliced = word[0...idx] + "_" + word[idx + 1..-1]

      word_list[sliced].each do |w|
        if !visited[w]
          current_visited = visited.dup
          current_path = path.dup
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

# 17) Word Ladder
# def ladder_length(begin_word, end_word, word_list)
#   queue = [begin_word]
#   count = 1
#   visited = {}

#   until queue.empty?
#     current = queue.shift

#     if current.is_a? Array
#       count = current[1]
#       current = current[0]
#     end

#     word_list.each do |word|
#       if !visited[word] && oneChangeAway(word, current)
#         queue << [word, count + 1]
#         visited[word] = true

#         if word == end_word
#           return count + 1
#         end
#       end
#     end
#   end

#   0
# end

# def oneChangeAway(word1, word2)
#   difference = (word1.length - word2.length).abs
#   return false if difference > 1
#   shorter_length = word1.length > word2.length ? word2.length : word1.length

#   (0...shorter_length).each do |i|
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
    word, count = queue.shift
    (0...word.length).each do |i|
      sliced = word[0...i] + "_" + word[i + 1..-1]
      
      word_list[sliced].each do |neighbor|
        if !visited[neighbor]
          queue << [neighbor, count + 1]
          visited[neighbor] = true

          return count + 1 if neighbor == end_word
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

# 18) Binary Tree Preorder Traversal
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
      res << root.val
      stack << root
      root = root.left
    else
      current = stack.pop
      root = current.right
    end
  end

  res
end

# 19) Binary Tree Postorder Traversal
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
  
  while stack.length != 0 || root
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

# 20) Reverse Words in a String
def reverse_words(str)
  str.strip.split(/\s+/).reverse.join(" ")
end

# 21) Isomorphic Strings
def is_isomorphic(s1, s2)
  return false if s1.length != s2.length

  pairs = {}
  seen = {}
  
  (0...s1.length).each do |i|
    if (seen[s2[i]] || pairs[s1[i]])
      return false if pairs[s1[i]] != s2[i]
    end

    seen[s2[i]] = true
    pairs[s1[i]] = s2[i]
  end

  true
end

# 22) Reverse Linked List
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

# 23) Course Schedule
def can_finish(num_courses, prerequisites)
  in_edges_count = Hash.new(0)
  out_edges = Hash.new { |h, k| h[k] = [] }

  prerequisites.each do |pair|
    in_edges_count[pair[0]] += 0
    in_edges_count[pair[1]] += 1
    out_edges[pair[1]] += []
    out_edges[pair[0]] << pair[1]
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

# 24) Implement Trie
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

# 25) The Skyline Problem
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

  def self.child_indices(parent_index, length)
    children = [parent_index * 2 + 1, parent_index * 2 + 2]
    children.select { |val| val < length }
  end

  def self.parent_index(child_idx)
    raise "no parent" if (child_idx - 1) / 2 < 0
    (child_idx - 1) / 2
  end

  def self.heapify_up(array, child_index, &prc)
    return array if child_index == 0
    prc ||= Proc.new { |a, b| b <=> a }
    parent = parent_index(child_index)

    if prc.call(array[child_index][0], array[parent][0]) < 1
      array[child_index], array[parent] = array[parent], array[child_index]
      heapify_up(array, parent, &prc)
    end

    array
  end

  def self.heapify_down(array, parent_index, &prc)
    prc ||= Proc.new { |a, b| b <=> a }
    children = child_indices(parent_index, array.length)

    if children.length == 2
      child = prc.call(array[children[0]][0], array[children[1]][0]) < 1 ? children[0] : children[1]
    elsif children.length == 1
      child = children[0]
    else
      return array
    end

    if prc.call(array[child][0], array[parent_index][0]) < 1
      array[child], array[parent_index] = array[parent_index], array[child]
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

    if skyline.empty? || height != skyline[-1][1]
      skyline << [x, height]
    end
  end

  skyline
end

# 26) Invert Binary Tree
def invert_tree(root)
  return root unless root

  temp = root.left
  root.left = invert_tree(root.right)
  root.right = invert_tree(temp)

  root
end

# 27) Valid Anagram
def is_anagram(s, t)
  return false if s.length != t.length

  hash = Hash.new(0)
  (0...s.length).each do |i|
    hash[s[i]] += 1
    hash[t[i]] -= 1
  end

  hash.all? { |k, v| v == 0 }
end
















