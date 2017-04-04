class QuickSort
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def sort!(left_index = 0, right_index = string.length - 1)
    if left_index < right_index
      pivot_index = rand(left_index..right_index)
      new_pivot_index = partition(left_index, right_index, pivot_index)
      sort!(left_index, new_pivot_index - 1)
      sort!(new_pivot_index, right_index)
    end

    string
  end

  def partition(left_index, right_index, pivot_index)
    pivot_value = string[pivot_index]
    string[pivot_index], string[right_index] = string[right_index], string[pivot_index]
    new_pivot_index = left_index

    (left_index...right_index).each do |idx|
      if string[idx] <= pivot_value
        string[new_pivot_index], string[idx] = string[idx], string[new_pivot_index]
        new_pivot_index += 1
      end
    end

    new_pivot_index
  end
end

str = QuickSort.new("hello")

p str.sort!
