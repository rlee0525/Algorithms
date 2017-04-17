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
    node.next = nil
    node.prev = nil
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

a.append(b)
a.append(c)
a.append(d)
a.append(e)
a.append(f)
a.append(g)
a.delete(c)

p a.values
