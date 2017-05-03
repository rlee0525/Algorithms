object = [
  {"id": 1, "name": "San Francisco Bay Area", "parent_id": nil },
  {"id": 2, "name": "San Jose", "parent_id": 3 },
  {"id": 3, "name": "South Bay", "parent_id": 1 },
  {"id": 4, "name": "San Francisco", "parent_id": 1 },
  {"id": 5, "name": "Manhattan", "parent_id": 6 },
  {"id": 6, "name": "New York", "parent_id": nil }
]

def select_field(object)
  hash = Hash.new { |h, k| h[k] = [] }

  object.each do |obj|
    hash[obj[:parent_id]] << obj
  end

  hash.each do |k, v|
    hash[k] = v.sort_by { |obj| obj[:name] }
  end

  hash[nil].each do |parent|
    puts parent[:name]
    print_children(hash, parent[:id], 1)
  end

  hash
end

def print_children(hash, id, level)
  return unless hash[id]

  hash[id].each do |child|
    print "-" * level
    puts child[:name]
    print_children(hash, child[:id], level + 1)
  end
end

select_field(object)

def removeNodes(list, x)
  while list.val > x
    list = list.next

    if !list
      return nil
    end
  end

  root = list
  prev_node = root
  current_node = root.next

  while current_node
    if current_node.val > x
      prev_node.next = current_node.next
      current_node = current_node.next
    else
      prev_node = current_node
      current_node = current_node.next
    end
  end

  root
end

class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

a = Node.new(1)
b = Node.new(2)
c = Node.new(3)
d = Node.new(4)
e = Node.new(5)

a.next = b
b.next = c
c.next = d
d.next = e

p removeNodes(a, 0)
