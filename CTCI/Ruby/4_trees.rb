# Graph
class Vertex
  attr_accessor :in_edges, :out_edges, :value

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  attr_reader :to_vertex, :from_vertex, :weight

  def initialize(from_vertex, to_vertex, weight = 1)
    @to_vertex = to_vertex
    @from_vertex = from_vertex
    @weight = weight

    @to_vertex.in_edges << self
    @from_vertex.out_edges << self
  end

  def destroy!
    self.to_vertex.in_edges.delete(self)
    self.from_vertex.out_edges.delete(self)
    self.to_vertex = nil
    self.from_vertex = nil
  end

  protected

  attr_writer :to_vertex, :from_vertex, :weight
end

# Test Graph
a = Vertex.new(1)
b = Vertex.new(2)
c = Vertex.new(3)
d = Vertex.new(4)
e = Vertex.new(5)
f = Vertex.new(6)
Edge.new(a, b)
Edge.new(c, d)
Edge.new(e, f)
Edge.new(a, d)
Edge.new(b, e)
Edge.new(a, c)

# Time O(N)
# Space O(N)
# BFS using queue!
def route_nodes(start_vertex, end_vertex)
  return true if start_vertex == end_vertex

  queue = [start_vertex]
  visited = {}

  until queue.empty?
    current = queue.shift

    current.out_edges.each do |edge|
      return true if edge.to_vertex == end_vertex

      unless visited[edge.to_vertex]
        queue << edge.to_vertex
      end
    end

    visited[current] = true
  end

  false
end

p route_nodes(c, a) == false
p route_nodes(a, c) == true

# Time O(N)
# Space O(N)
# DFS using stack!
def route_nodes_rec(start_vertex, end_vertex)
  return true if start_vertex == end_vertex

  visited ||= {}
  visited[start_vertex] = true

  start_vertex.out_edges.each do |edge|
    unless visited[edge.to_vertex]
      return true if route_nodes_rec(edge.to_vertex, end_vertex)
    end
  end

  false
end

p route_nodes_rec(c, a) == false
p route_nodes_rec(a, c) == true

class Tree
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def to_array
    queue = [self]

    array = []

    until queue.empty?
      current = queue.shift

      if current
        array << current.value
        queue << current.left
        queue << current.right
      end
    end

    array
  end
end

# Time O(N)
# Space O(N)
def minimal_tree(sorted_array)
  return if sorted_array.empty?

  mid = sorted_array.length / 2

  tree = Tree.new(sorted_array[mid])
  tree.left = minimal_tree(sorted_array[0...mid])
  tree.right = minimal_tree(sorted_array[mid + 1...sorted_array.length])

  tree
end

p minimal_tree([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]).to_array == [6, 3, 9, 2, 5, 8, 10, 1, 4, 7]

class Node
  attr_accessor :value, :next, :prev

  def initialize(value = nil)
    @value = value
    @next = nil
    @prev = nil
  end
end

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def append(node)
    last_node = @tail.prev

    last_node.next = node
    node.prev = last_node
    node.next = @tail
    @tail.prev = node
  end

  def delete(node)
    node.next.prev = node.prev
    node.prev.next = node.next
    node.next = nil
    node.prev = nil
  end

  def display_values
    string = ""

    current_node = @head.next

    while current_node != @tail
      string += current_node.value.to_s
      current_node = current_node.next
    end

    string
  end
end

# Time O(N) - excluding the display part
# Space O(N)
def list_of_depths(tree)
  lists = {}
  add_to_list(lists, tree, 1)

  display = []

  lists.each do |_, list|
    display << list.display_values
  end

  display
end

def add_to_list(lists, tree, depth)
  if !lists[depth]
    lists[depth] = LinkedList.new
  end

  lists[depth].append(Node.new(tree.value))

  add_to_list(lists, tree.left, depth + 1) if tree.left
  add_to_list(lists, tree.right, depth + 1) if tree.right
end


new_tree = minimal_tree([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
p list_of_depths(new_tree) == ["6", "39", "25810", "147"]

def is_balanced?(tree)
  check_balanced(tree) != false
end

def check_balanced(tree)
  return -1 unless tree

  depth_left = check_balanced(tree.left)
  depth_right = check_balanced(tree.right)

  return false if depth_right == false || depth_left == false
  return false if (depth_left - depth_right).abs > 1

  [depth_left, depth_right].max + 1
end

bad_tree = Tree.new(5)
bad_tree.left = Tree.new(3)
bad_tree.left.left = Tree.new(2)
bad_tree.left.left.left = Tree.new(1)
bad_tree.right = Tree.new(9)
bad_tree.right.left = Tree.new(10)

p is_balanced?(new_tree) == true
p is_balanced?(bad_tree) == false

def is_bst?(tree)
  valid_tree(tree, -Float::INFINITY, Float::INFINITY)
end

def valid_tree(tree, min, max)
  return true unless tree
  return false if tree.value <= min || tree.value > max

  valid_tree(tree.left, min, tree.value) && valid_tree(tree.right, tree.value, max)
end

p is_bst?(new_tree) == true
p is_bst?(bad_tree) == false


class ParentTree
  attr_accessor :left, :right, :parent, :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @parent = nil
  end
end

def successor(node)
  if node.right
    current = node.right
    while current.left
      current = current.left
    end

    current
  elsif !node.parent && !node.right
    nil
  else
    parent = node.parent

    return parent if parent.left == node

    while parent.right == node
      return nil unless parent.parent

      grand_parent = parent.parent

      if grand_parent.left == parent
        return grand_parent
      else
        parent = grand_parent
      end

      node = parent
    end
  end
end

tree_a = ParentTree.new(1)
tree_b = ParentTree.new(2)
tree_c = ParentTree.new(3)
tree_d = ParentTree.new(4)
tree_e = ParentTree.new(5)
tree_f = ParentTree.new(6)
tree_g = ParentTree.new(7)
tree_h = ParentTree.new(8)
tree_i = ParentTree.new(9)
tree_j = ParentTree.new(10)

test_tree = tree_f
test_tree.left = tree_c
tree_c.parent = tree_f
test_tree.right = tree_i
tree_i.parent = tree_f
test_tree.left.left = tree_b
tree_b.parent = tree_c
test_tree.left.right = tree_e
tree_e.parent = tree_c
test_tree.right.left = tree_h
tree_h.parent = tree_i
test_tree.right.right = tree_j
tree_j.parent = tree_i
test_tree.left.left.left = tree_a
tree_a.parent = tree_b
test_tree.left.right.left = tree_d
tree_d.parent = tree_e
test_tree.right.left.left = tree_g
tree_g.parent = tree_h

p successor(tree_e) == tree_f
p successor(tree_a) == tree_b
p successor(tree_i) == tree_j
p successor(tree_g) == tree_h
p successor(tree_f) == tree_g

def build_order(projects, dependencies)
  build_edges(dependencies)

  ordered = []
  queue = projects
  count = 0

  until queue.empty?
    current = queue.shift
    if current.in_edges.empty?
      ordered << current
      count = 0
      current.out_edges.each do |edge|
        return false if ordered.include?(edge.to_vertex)
        edge.to_vertex.in_edges.delete(edge)
      end
    else
      queue << current
      count += 1

      return false if count == queue.length
    end
  end

  ordered
end

def build_edges(dependencies)
  dependencies.each do |pair|
    Edge.new(pair[0], pair[1])
  end
end

aa = Vertex.new("a")
bb = Vertex.new("b")
cc = Vertex.new("c")
dd = Vertex.new("d")
ee = Vertex.new("e")
ff = Vertex.new("f")
gg = Vertex.new("g")

hh = Vertex.new("h")
ii = Vertex.new("i")
jj = Vertex.new("j")
kk = Vertex.new("k")
ll = Vertex.new("l")

proj_arr = [aa, bb, cc, dd, ee, ff, gg]
depen_arr = [[ff, cc], [ff, bb], [ff, aa], [bb, aa],
             [cc, aa], [bb, ee], [aa, ee], [dd, gg]]
proj_arr2 = [hh, ii, jj, kk, ll]
cyclic_arr = [[hh, kk], [ll, ii], [kk, hh], [ll, hh], [kk, jj]]

p build_order(proj_arr, depen_arr) == [dd, ff, gg, bb, cc, aa, ee]
p build_order(proj_arr2, cyclic_arr) == false

def build_order_dfs(projects, dependencies)
  build_edges(dependencies)
  ordered = []
  visited = {}

  projects.each do |project|
    dfs(ordered, project, visited) unless visited[project]
  end

  ordered
end

def dfs(ordered, project, visited)
  visited[project] = true

  project.out_edges.each do |edge|
    dfs(ordered, edge.to_vertex, visited)
  end

  ordered.unshift(project) unless ordered.include?(project)
end

aaa = Vertex.new("a")
bbb = Vertex.new("b")
ccc = Vertex.new("c")
ddd = Vertex.new("d")
eee = Vertex.new("e")
fff = Vertex.new("f")
ggg = Vertex.new("g")

# hhh = Vertex.new("h")
# iii = Vertex.new("i")
# jjj = Vertex.new("j")
# kkk = Vertex.new("k")
# lll = Vertex.new("l")

proj_arr3 = [aaa, bbb, ccc, ddd, eee, fff, ggg]
depen_arr3 = [[fff, ccc], [fff, bbb], [fff, aaa], [bbb, aaa],
              [ccc, aaa], [bbb, eee], [aaa, eee], [ddd, ggg]]
# proj_arr4 = [hhh, iii, jjj, kkk, lll]
# error_arr4 = [[hhh, kkk], [lll, iii], [kkk, hhh], [lll, hhh], [kkk, jjj]]

p build_order_dfs(proj_arr3, depen_arr3) == [fff, ddd, ggg, ccc, bbb, aaa, eee]
# p build_order_dfs(proj_arr4, error_arr4) == false

class TreeNode
  attr_accessor :value, :left, :right, :parent

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @parent = nil
  end
end

fca_a = TreeNode.new(10)
fca_b = TreeNode.new(8)
fca_c = TreeNode.new(6)
fca_d = TreeNode.new(2)
fca_e = TreeNode.new(9)
fca_f = TreeNode.new(12)
fca_a.left = fca_b
fca_b.parent = fca_a
fca_a.right = fca_f
fca_f.parent = fca_a
fca_b.left = fca_c
fca_c.parent = fca_b
fca_b.right = fca_e
fca_e.parent = fca_b
fca_c.left = fca_d
fca_d.parent = fca_c


def first_common_ancestor(node1, node2)
  visited = {}

  while node1.parent
    visited[node1.parent] = true
    node1 = node1.parent
  end

  while node2.parent
    return node2.parent if visited[node2.parent]
    node2 = node2.parent
  end

  nil
end

p first_common_ancestor(fca_b, fca_c) == fca_a
p first_common_ancestor(fca_d, fca_e) == fca_b
p first_common_ancestor(fca_f, fca_d) == fca_a
