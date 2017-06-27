# Given a linked list, remove the nth node from the end of list and return its head.

# For example,

#    Given linked list: 1->2->3->4->5, and n = 2.

#    After removing the second node from the end, the linked list becomes 1->2->3->5.
# Note:
# Given n will always be valid.
# Try to do this in one pass.

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  slow = head
  fast = head
  n.times { fast = fast.next }

  while fast && fast.next
    slow = slow.next
    fast = fast.next
  end
  
  if !fast
    new_head = slow.next
    slow.next = nil
    new_head
  elsif !fast.next
    next_node = slow.next
    next_next_node = next_node.next
    slow.next = next_next_node
    next_node.next = nil
    head
  end
end