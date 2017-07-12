# Given a linked list, swap every two adjacent nodes and return its head.

# For example,
# Given 1->2->3->4, you should return the list as 2->1->4->3.

# Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  return [] unless head
  return head unless head.next
  
  current = dummy = ListNode.new(0)
  current.next = head

  while head.next
    current.next = head.next
    temp = head.next.next
    current = head
    swap(head, head.next)
    head = temp

    break unless head
  end

  dummy.next
end

def swap(node1, node2)
  if node2.next
    node1.next = node2.next
  else
    node1.next = nil
  end
  
  node2.next = node1
end