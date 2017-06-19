# Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. 
# Return the sum of the three integers. You may assume that each input would have exactly one solution.

#     For example, given array S = {-1 2 1 -4}, and target = 1.

#     The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}

def three_sum_closest(nums, target)
  nums.sort!
  difference = nil

  (0...nums.length - 1).each do |idx|
    low = idx + 1
    high = nums.length - 1

    while low < high
      curr_difference = target - nums[idx] - nums[low] - nums[high]

      if curr_difference > 0
        low += 1
      elsif curr_difference < 0
        high -= 1
      else
        return target
      end
      
      if !difference && curr_difference.abs > difference.abs
        difference = curr_difference
      end
    end
  end

  target - difference
end