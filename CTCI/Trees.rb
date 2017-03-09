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
