def maxDifference(a)
  return -1 if a.length < 2

  difference = a[1] - a[0]
  min_element = a[0]

  (0...a.length).each do |i|
    if a[i] - min_element > difference
      difference = a[i] - min_element
    end

    if min_element > a[i]
      min_element = a[i]
    end
  end

  difference
end

a = [0, 4, 1, 2, 3]

p maxDifference(a)
