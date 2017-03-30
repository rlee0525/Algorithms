# Time O(N)
# Space O(N)
def is_unique(str)
  set = {}

  str.chars.each do |char|
    return false if set[char]
    set[char] = true
  end

  true
end

p is_unique("hello") == false
p is_unique("hiewqklm") == true

# Time O(N^2)
# Space O(1)
def is_unique2(str)
  (0...str.length).each do |i|
    (i + 1...str.length).each do |j|
      return false if str[i] == str[j]
    end
  end

  true
end

p is_unique2("hello") == false
p is_unique2("hiewqklm") == true

class QuickSort
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def sort(left_index = 0, right_index = string.length - 1)
    if left_index < right_index
      pivot_index = rand(left_index..right_index)
      new_pivot_index = partition(left_index, right_index, pivot_index)
      sort(left_index, new_pivot_index - 1)
      sort(new_pivot_index, right_index)
    end

    string
  end

  private

  def partition(left_index, right_index, pivot_index)
    pivot_value = string[pivot_index]
    string[pivot_index], string[right_index] = string[right_index], string[pivot_index]
    new_pivot_index = left_index
    (new_pivot_index...right_index).each do |i|
      if string[i] <= pivot_value
        string[new_pivot_index], string[i] = string[i], string[new_pivot_index]
        new_pivot_index += 1
      end
    end

    new_pivot_index
  end
end


# Time O(N log N)
# Space O(1)
def is_unique3(str)
  str = QuickSort.new(str)

  str.sort
end

p is_unique3("hello")
