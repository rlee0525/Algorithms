def three_sum(nums)
  return [] if nums.length < 3

  seen = {}
  indices = []

  i = 0
  while i < nums.length
    j = i + 1
    while j < nums.length
      if seen[nums[j]] && seen[nums[j]].length == 2
        indices << seen[nums[j]] + [nums[j]] unless indices.include?(seen[nums[j]] + [nums[j]])
      end
      
      seen[(0 - nums[i] - nums[j])] = [nums[i], nums[j]]
      j += 1
    end
    
    i += 1
  end
  
  sorted = []
  indices.map { |index| sorted << index.sort }
  sorted.uniq
end

S = [-1, 0, 1, 2, -1, -4]

p three_sum(S) #== [[-1, 0, 1], [-1, -1, 2]]