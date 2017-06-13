def two_sum(nums, target)
  hash = {}

  nums.each_with_index do |num, idx|
    return [hash[num], idx] if hash[num]
    hash[target - num] = idx
  end
end