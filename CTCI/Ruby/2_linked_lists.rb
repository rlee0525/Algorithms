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
    @tail.prev.next = node
    node.prev = @tail.prev
    node.next = @tail
    @tail.prev = node
  end

  def delete(node)
    node.prev.next = node.next
    node.next.prev = node.prev
  end

  def values
    string = ""
    node = @head.next
    count = 0

    until node == @tail
      string += "(Node #{count}: #{node.value}) "
      count += 1
      node = node.next
    end

    string.strip!
  end
end

a = LinkedList.new
b = Node.new(1)
c = Node.new(11)
d = Node.new(10)
e = Node.new(5)
f = Node.new(7)
g = Node.new(3)
h = Node.new(1)

a.append(b)
a.append(c)
a.append(d)
a.append(e)
a.append(f)
a.append(g)
a.append(h)

# p a.values

# Time O(N)
# Space O(N)
def remove_dups(linked_list)
  node = linked_list.head.next
  seen = {}

  until node == linked_list.tail
    linked_list.delete(node) if seen[node.value]
    seen[node.value] = true

    node = node.next
  end

  linked_list
end

p remove_dups(a).values == "(Node 0: 1) (Node 1: 11) (Node 2: 10) (Node 3: 5) (Node 4: 7) (Node 5: 3)"

# Time O(N)
# Space O(1)
def kth_to_last(linked_list, k)
  current_node = linked_list.head.next
  kth_node = current_node

  k.times do
    kth_node = kth_node.next
  end

  until kth_node.next == @tail
    current_node = current_node.next
    kth_node = kth_node.next
  end

  current_node
end

p kth_to_last(a, 2).value == 7

# Time O(1)
# Space O(1)
def delete_middle_node(node)
  temp = node.prev
  temp.next = node.next
  node.next.prev = temp
end

delete_middle_node(d)
p a.values == "(Node 0: 1) (Node 1: 11) (Node 2: 5) (Node 3: 7) (Node 4: 3)"
