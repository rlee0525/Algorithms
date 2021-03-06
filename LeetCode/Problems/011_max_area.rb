# Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). 
# n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). F
# ind two lines, which together with x-axis forms a container, such that the container contains the most water.

# Note: You may not slant the container and n is at least 2.

def max_area(height)
  max_area = 0
  seen = {}

  (0...height.length).each do |idx|
    next if seen[idx]
    seen[idx] = true

    (idx + 1...height.length).each do |idx2|
      h = [height[idx], height[idx2]].min
      area = h * (idx2 - idx)
      max_area = area > max_area ? area : max_area
    end
  end
  
  max_area
end

# Time O(N^2) TLE

def max_area(height)
  max_area = 0

  i = 0
  j = height.length - 1

  while i < j
    min = height[i] > height[j] ? j : i
    area = height[min] * (j - i)
    max_area = area > max_area ? area : max_area
    min == j ? j -= 1 : i += 1
  end
  
  max_area
end

# Time O(N)