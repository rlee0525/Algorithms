# Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.

# k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.

# You may not alter the values in the nodes, only nodes itself may be changed.

# Only constant memory is allowed.

# For example,
# Given this linked list: 1->2->3->4->5

# For k = 2, you should return: 2->1->4->3->5

# For k = 3, you should return: 3->2->1->4->5

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  return [] unless head

  prev = dummy = ListNode.new(0)
  current = head
  prev.next = current

  while current.next
    after = current.next
    
    if after.val % k == 0 && k != 1
      prev.next = after
      temp = after.next
      after.next = current
      current.next = temp
    end
    
    prev = prev.next
    current = current.next
    
    break unless current
  end

  dummy.next
end

prev = 1, curr = 2

after = nil
1.next = nil
temp = nil.next (nil)
