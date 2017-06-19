# Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

# Note: The solution set must not contain duplicate triplets.

# For example, given array S = [-1, 0, 1, 2, -1, -4],

# A solution set is:
# [
#   [-1, 0, 1],
#   [-1, -1, 2]
# ]

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  seen = {}
  set = []

  i = 0
  while i < nums.length
    j = i + 1
    while j < nums.length
      k = j + 1
      while k < nums.length
        if nums[i] + nums[j] + nums[k] == 0 && !seen[[nums[i], nums[j], nums[k]].sort]
          seen[[nums[i], nums[j], nums[k]].sort] = true
          set << [nums[i], nums[j], nums[k]] 
        end
        
        k += 1
      end
      j += 1
    end
    i += 1
  end
  
  set
end

# Time O(N^3)
def three_sum(nums)
  nums.sort!
  set = []
  i = 0

  while i < nums.length - 2
    low = i + 1
    high = nums.length - 1

    if (i == 0 || (i > 0 && nums[i] > nums[i - 1]))
      while low < high
        if nums[low] + nums[high] + nums[i] == 0
          set << [nums[i], nums[low], nums[high]]
          low += 1
          high -= 1
          
          while nums[low] == nums[low - 1]
            low += 1
          end
        
          while nums[high] == nums[high + 1]
            high -= 1
          end
        
        elsif nums[low] + nums[high] < 0 - nums[i]
          low += 1
        else
          high -= 1
        end
      end
    end
    
    i += 1
  end
  
  set
end
