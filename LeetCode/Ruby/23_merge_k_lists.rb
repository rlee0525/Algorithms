# Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode[]} lists
# @return {ListNode}
class BinaryMinHeap
  attr_accessor :store, :prc

  def initialize(&prc)
    @store = []
  end

  def peek
    @store[0]
  end
  
  def count
    @store.length
  end

  def push(node)
    @store << node
    c_idx = @store.length - 1
    
    BinaryMinHeap.heapify_up(@store, c_idx, count, &prc)
  end

  def extract(node)
    @store[0], @store[-1] = @store[-1], @store[0]
    extracted = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, count, &prc)
    extracted
  end

  def self.child_indices(parent_idx, len)
    c_idx = [parent_idx * 2 + 1, parent_idx * 2 + 2]
    c_idx.select { |child| child < len }
  end
  
  def self.parent_index(child_idx)
    raise "root has no parent" if (child_idx - 1) / 2 < 0
    (child_idx - 1) / 2 
  end

  def self.heapify_down(arr, parent_idx, len = arr.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    c_idx = child_indices(parent_idx, len)

    if c_idx.length > 1
      c_idx = prc.call(c_idx[0], c_idx[1]) < 1 ? c_idx[0] : c_idx[1]
    elsif c_idx.length == 1
      c_idx = c_idx[0]
    else
      return arr
    end
    
    if prc.call(arr[parent_idx], arr[c_idx]) == 1
      arr[parent_idx], arr[c_idx] = arr[c_idx], arr[parent_idx]
      heapify_down(arr, c_idx, len, &prc)
    end

    arr
  end
  
  def self.heapify_up(arr, c_idx, len = arr.length, &prc)
    return arr if c_idx == 0

    prc ||= Proc.new { |a, b| a <=> b }
    p_idx = parent_index(c_idx)

    if prc.call(arr[p_idx], arr[c_idx]) == 1
      arr[p_idx], arr[c_idx] = arr[c_idx], arr[p_idx]
      heapify_up(arr, p_idx, len, &prc)
    end
    
    arr
  end
end

def merge_k_lists(lists)
  queue = BinaryMinHeap.new

  lists.each do |list|

    while list
      queue.push(list.val)
      list = list.next
    end
  end
  
  queue.store.sort
end

# Passes the test but incorrect answer