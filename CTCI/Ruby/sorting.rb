def bubble_sort(array)
  sorted = false

  until sorted
    sorted = true

    (0...array.length).each do |i|
      (i + 1...array.length).each do |j|
        if array[i] > array[j]
          array[i], array[j] = array[j], array[i]
          sorted = false
        end
      end
    end
  end

  array
end

p bubble_sort([1, 2, 45, 1, 3, 4, 7, 2, 1, 100, 312])

def merge_sort(array)
  return array if array.length < 2

  mid = array.length / 2
  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid..-1])

  merge(left, right)
end

def merge(left, right)
  result = []

  until left.empty? || right.empty?
    if left.first < right.first
      result << left.shift
    else
      result << right.shift
    end
  end

  result + left + right
end

p merge_sort([1, 2, 45, 1, 3, 4, 7, 2, 1, 100, 312])
