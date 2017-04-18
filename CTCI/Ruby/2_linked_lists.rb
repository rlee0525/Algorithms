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

    while node.value
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

# Time O(N)
# Space O(N)
def partition(linked_list, x)
  left_partition = LinkedList.new
  right_partition = LinkedList.new

  current_node = linked_list.head.next

  until current_node == linked_list.tail
    if current_node.value < x
      next_node = current_node.next
      linked_list.delete(current_node)
      left_partition.append(current_node)
    else
      next_node = current_node.next
      linked_list.delete(current_node)
      right_partition.append(current_node)
    end

    current_node = next_node
  end

  right_head = right_partition.head.next
  left_tail = left_partition.tail.prev

  left_tail.next = right_head
  right_head.prev = left_tail

  left_partition
end

new_list = LinkedList.new
n1 = Node.new(3)
n2 = Node.new(5)
n3 = Node.new(8)
n4 = Node.new(5)
n5 = Node.new(10)
n6 = Node.new(2)
n7 = Node.new(1)

new_list.append(n1)
new_list.append(n2)
new_list.append(n3)
new_list.append(n4)
new_list.append(n5)
new_list.append(n6)
new_list.append(n7)

p partition(new_list, 5).values == "(Node 0: 3) (Node 1: 2) (Node 2: 1) (Node 3: 5) (Node 4: 8) (Node 5: 5) (Node 6: 10)"

# Time O(N)
# Space O(N)
def sum_lists(list1, list2)
  num = 0
  factor = 1

  list1_node = list1.head.next
  list2_node = list2.head.next

  while list1_node.value
    num += (list1_node.value * factor)
    num += (list2_node.value * factor)
    list1_node = list1_node.next
    list2_node = list2_node.next
    factor *= 10
  end

  string_num = num.to_s
  new_list = LinkedList.new

  (string_num.length - 1).downto(0).each do |idx|
    new_node = Node.new(string_num[idx].to_i)
    new_list.append(new_node)
  end

  new_list
end

list1_sum_list = LinkedList.new
list1a = Node.new(7)
list1b = Node.new(1)
list1c = Node.new(6)
list1_sum_list.append(list1a)
list1_sum_list.append(list1b)
list1_sum_list.append(list1c)

list2_sum_list = LinkedList.new
list2a = Node.new(5)
list2b = Node.new(9)
list2c = Node.new(2)
list2_sum_list.append(list2a)
list2_sum_list.append(list2b)
list2_sum_list.append(list2c)

p sum_lists(list1_sum_list, list2_sum_list).values == "(Node 0: 2) (Node 1: 1) (Node 2: 9)"

# Doubly-linked list
# Time O(N/2)
# Space O(1)
def is_palindrome?(linked_list)
  first_node = linked_list.head
  last_node = linked_list.tail

  until first_node == last_node || first_node.prev == last_node
    return false if first_node.value != last_node.value
    first_node = first_node.next
    last_node = last_node.prev
  end

  true
end

list3_sum_list = LinkedList.new
list3a = Node.new(3)
list3b = Node.new(9)
list3c = Node.new(3)
list3_sum_list.append(list3a)
list3_sum_list.append(list3b)
list3_sum_list.append(list3c)

p is_palindrome?(list1_sum_list) == false
p is_palindrome?(list3_sum_list) == true

def is_palindrome2?(linked_list)
  slow_runner = linked_list.head.next
  fast_runner = linked_list.head.next

  first_half = []
  length = 0

  while fast_runner.value
    first_half << slow_runner
    slow_runner = slow_runner.next

    if fast_runner.next.value
      fast_runner = fast_runner.next.next
      length += 1
    else
      break
    end
  end

  if length.odd?
    (first_half.length - 2).downto(0).each do |idx|
      return false if first_half[idx].value != slow_runner.value
      slow_runner = slow_runner.next
    end
  else
    (first_half.length - 1).downto(0).each do |idx|
      return false if first_half[idx].value != slow_runner.value
      slow_runner = slow_runner.next
    end
  end

  true
end

p is_palindrome2?(list1_sum_list) == false
p is_palindrome2?(list3_sum_list) == true

class SinglyLinkedList
  attr_accessor :head, :tail

  def initialize
    @head = Node.new(nil)
    @tail = Node.new(nil)
    @head.next = @tail
  end

  def last_node
    current_node = @head

    until current_node.next == @tail
      current_node = current_node.next
    end

    current_node
  end

  def append(node)
    last_node.next = node
    node.next = @tail
  end
end

# Singly-linked lists!
# Time O(N)
# Space O(N)
def intersection(list1, list2)
  seen = {}

  list1_current = list1.head.next
  list2_current = list2.head.next

  while list1_current.next.value || list2_current.next.value
    return list1_current if seen[list1_current]
    return list2_current if seen[list2_current]

    seen[list1_current] = true
    seen[list2_current] = true

    list1_current = list1_current.next
    list2_current = list2_current.next
  end

  false
end

single_list1 = SinglyLinkedList.new

inter_node1 = Node.new(3)
inter_node2 = Node.new(1)
inter_node3 = Node.new(5)
inter_node4 = Node.new(9)
inter_node5 = Node.new(7)
inter_node6 = Node.new(2)
inter_node7 = Node.new(1)

single_list1.append(inter_node1)
single_list1.append(inter_node2)
single_list1.append(inter_node3)
single_list1.append(inter_node4)
single_list1.append(inter_node5)
single_list1.append(inter_node6)
single_list1.append(inter_node7)

single_list2 = SinglyLinkedList.new
inter_node8 = Node.new(4)
inter_node9 = Node.new(6)

single_list2.append(inter_node8)
single_list2.append(inter_node9)
single_list2.append(inter_node5)
single_list2.append(inter_node6)
single_list2.append(inter_node7)

p intersection(single_list1, single_list2) == inter_node5

class CircularLinkedList
  attr_accessor :head, :tail

  def initialize
    @head = Node.new(nil)
  end

  def last_node
    current_node = @head

    while current_node.next
      current_node = current_node.next
    end

    current_node
  end

  def append(node)
    last_node.next = node
  end
end

def loop_detection(circular_list)
  seen = {}

  current_node = circular_list.head.next

  until seen[current_node]
    seen[current_node] = true
    current_node = current_node.next
  end

  current_node
end

single_list5 = CircularLinkedList.new

inter_node1 = Node.new(3)
inter_node2 = Node.new(50)
inter_node3 = Node.new(5)
inter_node4 = Node.new(9)
inter_node5 = Node.new(7)
inter_node6 = Node.new(2)
inter_node7 = Node.new(5)

single_list5.append(inter_node1)
single_list5.append(inter_node2)
single_list5.append(inter_node3)
single_list5.append(inter_node4)
single_list5.append(inter_node5)
single_list5.append(inter_node6)
single_list5.append(inter_node7)
single_list5.append(inter_node4)

p loop_detection(single_list5) == inter_node4
