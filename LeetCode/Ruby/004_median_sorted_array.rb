# There are two sorted arrays nums1 and nums2 of size m and n respectively.

# Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

# Example 1:
# nums1 = [1, 3]
# nums2 = [2]

# The median is 2.0
# Example 2:
# nums1 = [1, 2]
# nums2 = [3, 4]

# The median is (2 + 3)/2 = 2.5

# Time O(N+M / 2)
# def find_median_sorted_arrays(nums1, nums2)
#     total_length = (nums1 + nums2).length

#     count = 0
#     i = 0
#     j = 0
    
#     median = nil
#     prev_median = nil
    
#     while count <= total_length / 2
#         prev_median = median
        
#         if nums1[i] && (!nums2[j] || nums1[i] < nums2[j])
#             median = nums1[i]
#             i += 1
#         elsif nums2[j] && (!nums1[i] || nums1[i] >= nums2[j])
#             median = nums2[j]
#             j += 1
#         end
        
#         count += 1
#     end
    
#     if total_length.odd?
#         return median
#     else
#         return (prev_median + median) / 2.0
#     end
# end

def find_median_sorted_arrays(nums1, nums2)
   length = nums1.length + nums2.length
   length.odd? ? find_kth(nums1, nums2, length / 2) : (find_kth(nums1, nums2, length / 2) + find_kth(nums1, nums2, length / 2 - 1)) / 2.0
end

def find_kth(nums1, nums2, k)
  if nums1.length > nums2.length
    nums1, nums2 = nums2, nums1
  end
  
  if nums1.empty?
    return nums2[k]
  end
  
  if k == nums1.length + nums2.length - 1
    return [nums1[-1], nums2[-1]].max
  end
  
  i = [nums1.length - 1, k / 2].min
  j = [nums2.length - 1, k - i].min

  if nums1[i] > nums2[j]
    return find_kth(nums1[0...i], nums2[j..-1], i)
  else
    return find_kth(nums1[i..-1], nums2[0...j], j)
  end
end
# Time O(log(N + M))
# Space O(1)