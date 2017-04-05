class Link
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
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def append(link)
    @tail.prev.next = link
    link.prev = @tail.prev
    link.next = @tail
    @tail.prev = link

    link
  end
end

a = Link.new(5)
b = Link.new(3)
c = Link.new(10)
d = Link.new(1)

duplicated_list = LinkedList.new
# duplicated_list.append(a)
duplicated_list.append(b)
duplicated_list.append(b)
# duplicated_list.append(c)
# duplicated_list.append(d)

unsorted_list = LinkedList.new
# unsorted_list.append(a)
unsorted_list.append(b)
# unsorted_list.append(c)
# unsorted_list.append(d)

def remove_dups(list)
  seen = {}
  new_list = LinkedList.new

  current_link = list.head
  p current_link

  until current_link.value == list.tail.value
    if !seen[current_link.value]
      new_list.append(current_link)
      seen[current_link.value] = true
    end

    current_link = current_link.next
  end

  new_list
end

p remove_dups(duplicated_list)
# p unsorted_list
