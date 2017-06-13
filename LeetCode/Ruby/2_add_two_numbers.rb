# You are given two non-empty linked lists representing two non-negative integers. 
#The digits are stored in reverse order and each of their nodes contain a single digit. 
#Add the two numbers and return it as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)
  new_link = nil
  carry = 0

  while l1 || l2
    if l1 && l2
      new_val = l1.val + l2.val
    elsif l1
      new_val = l1.val
    else
      new_val = l2.val
    end
    
    new_val += carry

    if new_val > 9
      carry = 1
      new_val -= 10
    else
      carry = 0
    end

    if !new_link
      new_link = ListNode.new(new_val)
      result = new_link
    else
      new_link.next = ListNode.new(new_val)
      new_link = new_link.next
    end
    
    l1 = l1.next if l1
    l2 = l2.next if l2
  end
  
  if carry != 0
    new_link.next = ListNode.new(carry)
  end
  
  result
end
