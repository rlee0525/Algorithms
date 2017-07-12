# Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? 
# Find all unique quadruplets in the array which gives the sum of target.

# Note: The solution set must not contain duplicate quadruplets.

# For example, given array S = [1, 0, -1, 0, -2, 2], and target = 0.

# A solution set is:
# [
#   [-1,  0, 0, 1],
#   [-2, -1, 1, 2],
#   [-2,  0, 0, 2]
# ]

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
  nums.sort!
  set = []

  (0..nums.length - 3).each do |idx|
    if (idx == 0 || nums[idx] != nums[idx - 1])
      (idx + 1..nums.length - 2).each do |idx2|
        if (idx2 == idx + 1 || nums[idx2] != nums[idx2 - 1])
          low = idx2 + 1
          high = nums.length - 1

          while low < high
            if nums[idx] + nums[idx2] + nums[low] + nums[high] == target
              set << [nums[idx], nums[idx2], nums[low], nums[high]]
              low += 1
              high -= 1

              low += 1 while nums[low] == nums[low - 1]
              high -= 1 while nums[high] == nums[high + 1]
            elsif nums[idx] + nums[idx2] + nums[low] + nums[high] < target
              low += 1
            else
              high -= 1
            end
          end
        end
      end
    end
  end
  
  set
end