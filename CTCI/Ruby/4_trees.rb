# Graph
class Vertex
  attr_reader :value, :in_edges, :out_edges

  def initialize(value)
    @value, @in_edges, @out_edges = value, [], []
  end
end

class Edge
  attr_reader :to_vertex, :from_vertex, :weight

  def initialize(to_vertex, from_vertex, weight = 1)
    self.from_vertex = from_vertex
    self.to_vertex = to_vertex
    self.weight = weight

    self.from_vertex.out_edges << self
    self.to_vertex.in_edges << self
  end

  def destroy!
    self.from_vertex.out_edges.delete(self)
    self.from_vertex = nil
    self.to_vertex.in_edges.delete(self)
    self.to_vertex = nil
  end

  protected

  attr_writer :from_vertex, :to_vertex, :weight
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

def route_nodes(start_vertex, end_vertex)
  return true if start_vertex == end_vertex

end


# #Graph
# class Vertex
#   attr_reader :value, :in_edges, :out_edges
#
#   def initialize(value)
#     @value, @in_edges, @out_edges = value, [], []
#   end
# end
#
# class Edge
#   attr_reader :from_vertex, :to_vertex, :weight
#
#   def initialize(from_vertex, to_vertex, weight = 1)
#     self.from_vertex = from_vertex
#     self.to_vertex = to_vertex
#     self.weight = weight
#
#     self.from_vertex.out_edges << self
#     self.to_vertex.in_edges << self
#   end
#
#   def destroy!
#     self.from_vertex.out_edges.delete(self)
#     self.from_vertex = nil
#     self.to_vertex.in_edges.delete(self)
#     self.to_vertex = nil
#   end
#
#   protected
#
#   attr_writer :from_vertex, :to_vertex, :weight
# end
#
# #Test graph
# a = Vertex.new(1)
# b = Vertex.new(2)
# c = Vertex.new(3)
# d = Vertex.new(4)
# e = Vertex.new(5)
# f = Vertex.new(6)
# Edge.new(a, b)
# Edge.new(c, d)
# Edge.new(e, f)
# Edge.new(a, d)
# Edge.new(b, e)
# Edge.new(a, c)
#
# #4.1
# def route_nodes(start_vertex, end_vertex)
#   return true if start_vertex == end_vertex
#
#   queue = [start_vertex]
#   visited = []
#
#   until queue.empty?
#     current = queue.shift
#     current.out_edges.each do |edge|
#       unless visited.include?(edge.to_vertex)
#         return true if edge.to_vertex == end_vertex
#         queue << edge.to_vertex
#       end
#     end
#
#     visited << current
#   end
#
#   false
# end
#
# p route_nodes(a, c)
#
# def route_nodes_rec(start_vertex, end_vertex)
#   return true if start_vertex == end_vertex
#   @visited ||= {}
#   @visited[start_vertex] = true
#
#   start_vertex.out_edges.each do |edge|
#     unless @visited[edge.to_vertex]
#       return true if route_nodes_rec(edge.to_vertex, end_vertex)
#     end
#   end
#
#   false
# end
#
# p route_nodes_rec(c, d)
#
# class TreeNode
#   attr_accessor :value, :left, :right
#
#   def initialize(value)
#     @value = value
#     @left = nil
#     @right = nil
#   end
# end
#
# #4.2
# def minimal_tree(array)
#   return if array.empty?
#
#   mid = array.length / 2
#   tree = TreeNode.new(array[mid])
#   tree.left = minimal_tree(array[0...mid])
#   tree.right = minimal_tree(array[mid + 1..-1])
#
#   tree
# end
#
# p minimal_tree([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
#
# class Node
#   attr_accessor :value, :next, :prev
#
#   def initialize(value)
#     @value = value
#     @next = nil
#     @prev = nil
#   end
# end
#
# class LinkedList
#   def initialize
#     @head = TreeNode.new(nil)
#     @tail = TreeNode.new(nil)
#     @head.right = @tail
#     @tail.left = @head
#   end
#
#   def append(node)
#     temp = @tail.left #head in first case
#
#     temp.right = node
#     node.left = temp
#     @tail.left = node
#     node.right = @tail
#
#     node
#   end
#
#   def size
#     current = @head.right
#     count = 0
#
#     until current == @tail
#       count += 1
#       current = current.right
#     end
#
#     count
#   end
# end
#
# def depth_list(root)
#   lists = {}
#   add_to_list(lists, root, 0)
#   lists
# end
#
# def add_to_list(lists, root, depth)
#   if !lists[depth]
#     lists[depth] = LinkedList.new
#   end
#
#   lists[depth].append(root)
#   add_to_list(lists, root.left, depth - 1) if root.left
#   add_to_list(lists, root.right, depth - 1) if root.right
# end
#
# tree = minimal_tree([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
# p depth_list(tree) #depth of 4 ==> 4 linked lists
# p depth_list(tree).keys.length
#
#
#
#
#
#
# # def depth_list(tree)
# #   return unless root
# #
# #   lists = []
# #   add_to_list(lists, tree.root, 0)
# #   lists
# # end
# #
# # def add_to_list(lists, node, depth)
# #   if !lists[depth]
# #     lists[depth] = LinkedList.new
# #   end
# #
# #   lists[depth].append(node)
# #   add_to_list(lists, node.left, depth - 1)
# #   add_to_list(lists, node.right, depth - 1)
# # end
# #
# # def balanced_tree(root)
# #   check_height(root) != false
# # end
# #
# # def check_height(root)
# #   return -1 unless root
# #
# #   depth_left = balanced_tree(root.left)
# #   depth_right = balanced_tree(root.right)
# #
# #   return false if depth_left == false || depth_right == false
# #
# #   if (depth_left - depth_right).abs > 1
# #     return false
# #   else
# #     [depth_left, depth_right].max + 1
# #   end
# # end
# #
# # def is_bst?(tree)
# #   valid_bst?(tree.root, -FLOAT::INFINITY, FLOAT::INFINITY)
# # end
# #
# # def valid_bst?(node, min, max)
# #   return true if node.nil?
# #   return false if node.val < min || node.val >= max
# #
# #   valid_bst?(node.left, min, node.val) && valid_bst?(node.right, node.val, max)
# # end
# #
# # def successor(node)
# #
# # end

# #Graph
# class Vertex
#   attr_reader :value, :in_edges, :out_edges
#
#   def initialize(value)
#     @value, @in_edges, @out_edges = value, [], []
#   end
# end
#
# class Edge
#   attr_reader :from_vertex, :to_vertex, :weight
#
#   def initialize(from_vertex, to_vertex, weight = 1)
#     self.from_vertex = from_vertex
#     self.to_vertex = to_vertex
#     self.weight = weight
#
#     self.from_vertex.out_edges << self
#     self.to_vertex.in_edges << self
#   end
#
#   def destroy!
#     self.from_vertex.out_edges.delete(self)
#     self.from_vertex = nil
#     self.to_vertex.in_edges.delete(self)
#     self.to_vertex = nil
#   end
#
#   protected
#
#   attr_writer :from_vertex, :to_vertex, :weight
# end
