def search(nums, target)
  nums.each_with_index do |num, idx|
    return idx if num == target
  end
    
  -1
end

p search([4, 5, 6, 7, 0, 1, 2], 1) == 5

def search_binary(nums, target)	
	low, high = 0, nums.length - 1

	while low <= high
		mid = (low + high) / 2
		return mid if target == nums[mid]

		if nums[low] <= nums[mid]
			if nums[low] <= target && target <= nums[mid]
				high = mid - 1
			else
				low = mid + 1
			end
		else
			if nums[mid] <= target  && target <= nums[high]
				low = mid + 1
			else
				high = mid - 1
			end
		end
	end

	-1
end

p search_binary([4, 5, 6, 7, 0, 1, 2], 1) == 5