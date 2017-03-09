def route_nodes(start_node, end_node)
  return true if start_noed == end_node

  queue = [start_node]
  visited = []

  until queue.empty?
    current = queue.shift
    current.next_nodes.each do |node|
      unless visited.include?(node)
        if node == end_node
          return true
        else
          queue << node
        end
      end
    end
  end

  false
end


class Node
  attr_accessor :left, :right, :node

  def initialize(node)
    @node = node
    @left = left
    @right = right
  end
end

def minimal_tree(array)
  return array if array.length < 2

  mid = array.length / 2
  tree = Node.new(array[mid])
  tree.left = minimal_tree(array[0...mid])
  tree.right = minimal_tree(array[mid + 1..-1])
  tree
end

p minimal_tree([1, 2, 3, 4, 5, 6, 7])


class LinkedList
  attr_accessor :node, :next

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.right = nil
    @tail.left = nil
  end

  def append(node)
    new_link = Node.new(node)

    @tail.left.right = new_link
    new_link.left = @tail.left
    new_link.right = @tail
    @tail.left = new_link

    new_link
  end
end

def depth_list(tree)
  return unless root

  lists = []
  add_to_list(lists, tree.root, 0)
  lists
end

def add_to_list(lists, node, depth)
  if !lists[depth]
    lists[depth] = LinkedList.new
  end

  lists[depth].append(node)
  add_to_list(lists, node.left, depth - 1)
  add_to_list(lists, node.right, depth - 1)
end

def balanced_tree(root)
  check_height(root) != false
end

def check_height(root)
  return -1 unless root

  depth_left = balanced_tree(root.left)
  depth_right = balanced_tree(root.right)

  return false if depth_left == false || depth_right == false

  if (depth_left - depth_right).abs > 1
    return false
  else
    [depth_left, depth_right].max + 1
  end
end

def is_bst?(tree)
  valid_bst?(tree.root, -FLOAT::INFINITY, FLOAT::INFINITY)
end

def valid_bst?(node, min, max)
  return true if node.nil?
  return false if node.val < min || node.val >= max

  valid_bst?(node.left, min, node.val) && valid_bst?(node.right, node.val, max)
end
